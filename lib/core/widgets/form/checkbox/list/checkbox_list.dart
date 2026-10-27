import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';
import 'package:trading_management/core/widgets/form/checkbox/checkbox_option.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';

/// チェックリスト
///
/// - [field] フィールド
/// - [options] 選択肢リスト
/// - [showLabel] フィールド名を表示するかどうか
/// - [onChanged] 選択値が変わったときのコールバック
/// - [onSaved] 入力値保存時のコールバック
class CheckboxList<T> extends StatelessWidget {
  /// フィールド
  final AppFormField<List<T>> field;

  /// 選択肢リスト
  final List<CheckboxOption<T>> options;

  /// フィールド名を表示するかどうか
  final bool showLabel;

  /// 選択値が変わったときのコールバック
  final ValueChanged<List<T>>? onChanged;

  /// 入力値保存時のコールバック
  final FormFieldSetter<List<T>>? onSaved;

  const CheckboxList(
    this.field, {
    super.key,
    required this.options,
    this.showLabel = true,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) Label(field.name, isRequired: field.isRequired),
        FormField<List<T>>(
          key: ValueKey(field.id),
          initialValue: List<T>.of(field.value),
          onSaved: onSaved,
          builder: (state) {
            final selected = state.value ?? const [];

            return Column(
              children: [
                for (final (index, option) in options.indexed)
                  CheckboxTile(
                    AppFormField<bool>(
                      id: '${field.id}[$index]',
                      name: option.label,
                      value: selected.contains(option.value),
                    ),
                    key: ValueKey(option.value),
                    onChanged: onChanged == null
                        ? null
                        : (_) => _toggle(state, option.value),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  ///　チェック状態切り替え
  ///
  /// - [state] フォーム状態
  /// - [value] チェック状態
  void _toggle(FormFieldState<List<T>> state, T value) {
    final currentValues = state.value ?? <T>[];

    // チェック状態が true のとき、リストから削除
    // false のとき、リストへ追加
    final updatedValues = currentValues.contains(value)
        ? currentValues.where((item) => item != value).toList()
        : [...currentValues, value];

    state.didChange(updatedValues);
    onChanged?.call(updatedValues);
  }
}
