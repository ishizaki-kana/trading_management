import 'package:flutter/material.dart' hide Checkbox;
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';

/// チェックボックスリスト
///
/// チェックボックスを縦に並べて表示します。
///
/// - [options] チェックボックスの項目リスト
/// - [onChanged] 更新後の項目を通知するコールバック
class CheckboxList extends StatelessWidget {
  final List<CheckboxOption> options;
  final ValueChanged<List<CheckboxOption>>? onChanged;

  const CheckboxList({super.key, required this.options, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.s4,
      children: [
        for (final option in options)
          CheckboxTile(
            option: option,
            onChanged: onChanged == null
                ? null
                : (target) => onChanged!.call(_replace(target)),
          ),
      ],
    );
  }

  List<CheckboxOption> _replace(CheckboxOption target) {
    return [
      for (final option in options)
        option.value == target.value ? target : option,
    ];
  }
}
