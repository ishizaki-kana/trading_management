import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// チェックボックス
///
/// チェックボックスとラベルを横並びで表示します。
///
/// - [option] チェックボックス項目
/// - [onChanged] 更新後の項目を通知するコールバック
class CheckboxTile extends StatelessWidget {
  final CheckboxOption option;
  final ValueChanged<CheckboxOption>? onChanged;

  const CheckboxTile({super.key, required this.option, this.onChanged});

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

  /// チェック状態の切り替え
  void _toggle() {
    if (onChanged == null) return;
    onChanged?.call(option.copyWith(checked: !option.checked));
  }
}

/// チェックボックスオプション
///
/// - [value] 値
/// - [label] ラベル
/// - [checked] 選択されているかどうか
class CheckboxOption {
  final String value;
  final String label;
  final bool checked;

  const CheckboxOption({
    required this.value,
    required this.label,
    required this.checked,
  });

  /// コピー
  ///
  /// 一部の値を変更した新しいオブジェクトを返します。
  ///
  /// - [value] 値
  /// - [label] ラベル
  /// - [checked] 選択されているかどうか
  CheckboxOption copyWith({String? value, String? label, bool? checked}) =>
      CheckboxOption(
        value: value ?? this.value,
        label: label ?? this.label,
        checked: checked ?? this.checked,
      );
}
