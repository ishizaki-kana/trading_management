import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_option.dart';

/// ラジオグループ
///
/// - [field] フォームフィールド
/// - [options] 選択肢
/// - [showLabel] フィールド名を表示するかどうか
/// - [onSelected] 選択値が変わったときのコールバック
/// - [onSaved] 入力値保存時のコールバック
class AppRadioGroup extends StatelessWidget {
  //
  // fields
  //

  /// フォームフィールド
  final AppFormField<int> field;

  /// 選択肢
  final List<RadioOption> options;

  /// フィールド名を表示するかどうか
  final bool showLabel;

  /// 選択値が変わったときのコールバック
  final ValueChanged<int>? onSelected;

  /// 入力値保存時のコールバック
  final FormFieldSetter<int>? onSaved;

  //
  // constructor
  //

  const AppRadioGroup(
    this.field, {
    super.key,
    required this.options,
    this.showLabel = true,
    this.onSelected,
    this.onSaved,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) Label(field.name, isRequired: field.isRequired),
        FormField<int>(
          key: ValueKey(field.id),
          initialValue: field.value,
          onSaved: onSaved,
          builder: (state) {
            final currentValue = state.value;

            return Row(
              spacing: AppSpacing.s6,
              children: [
                for (final option in options)
                  ChoiceChip(
                    key: ValueKey(option.value),
                    label: Text(option.label),
                    selected: option.value == currentValue,
                    selectedColor: option.selectedColor,
                    labelStyle: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    chipAnimationStyle: ChipAnimationStyle(
                      selectAnimation: AnimationStyle(
                        duration: AppDuration.slow,
                      ),
                    ),
                    onSelected: onSelected == null
                        ? null
                        : (selected) {
                            if (selected) _select(state, option.value);
                          },
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  //
  // private methods
  //

  /// 選択値変更
  ///
  /// - [state] フィールドの状態
  /// - [value] 選択値
  void _select(FormFieldState<int> state, int value) {
    if (state.value == value) return;

    state.didChange(value);
    onSelected?.call(value);
  }
}
