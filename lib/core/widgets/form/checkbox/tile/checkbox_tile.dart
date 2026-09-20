import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/checkbox/checkbox_option.dart';

/// チェックボックス
///
/// チェックボックスとラベルを横並びで表示します。
///
/// - [option] チェックボックス項目
/// - [onChanged] 更新後の項目を通知するコールバック
class CheckboxTile extends StatelessWidget {
  //
  // fields
  //

  /// チェックボックス項目
  final CheckboxOption option;

  /// 更新後の項目を通知するコールバック
  final ValueChanged<CheckboxOption>? onChanged;

  //
  // constructor
  //

  const CheckboxTile({super.key, required this.option, this.onChanged});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            onChanged: onChanged == null ? null : (_) => _toggle(),
            value: option.checked,
          ),
        ),
        const SizedBox(width: AppSpacing.s4),
        Expanded(
          child: InkWell(
            onTap: onChanged == null ? null : _toggle,
            child: Text(option.label, style: theme.textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }

  //
  // private methods
  //

  /// チェック状態の切り替え
  void _toggle() {
    if (onChanged == null) return;
    onChanged?.call(option.copyWith(checked: !option.checked));
  }
}
