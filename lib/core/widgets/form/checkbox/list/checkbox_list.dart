import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/checkbox/checkbox_option.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';

/// チェックボックスリスト
///
/// チェックボックスを縦に並べて表示します。
///
/// - [options] 項目リスト
/// - [onChanged] 更新後の項目を通知するコールバック
class CheckboxList extends StatelessWidget {
  //
  // fields
  //

  /// 項目リスト
  final List<CheckboxOption> options;

  /// 更新後の項目を通知するコールバック
  final ValueChanged<List<CheckboxOption>>? onChanged;

  //
  // constructor
  //

  const CheckboxList({super.key, required this.options, this.onChanged});

  //
  // public methods
  //

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

  //
  // private methods
  //

  /// 項目リスト更新
  ///
  /// - [target] 更新対象の項目
  List<CheckboxOption> _replace(CheckboxOption target) {
    return [
      for (final option in options)
        option.value == target.value ? target : option,
    ];
  }
}
