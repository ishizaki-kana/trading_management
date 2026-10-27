import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/theme/app_theme.dart';

/// チェックボックス
///
/// - [field] フィールド
/// - [onChanged] 変更時のコールバック
/// - [onSaved] 保存時のコールバック
class CheckboxTile extends StatelessWidget {
  /// フィールド
  final AppFormField<bool> field;

  /// 変更時のコールバック
  final ValueChanged<bool>? onChanged;

  /// 保存時のコールバック
  final FormFieldSetter<bool>? onSaved;

  const CheckboxTile(this.field, {super.key, this.onChanged, this.onSaved});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTileTheme(
      data: AppTheme.checkboxTileTheme(theme),
      child: FormField<bool>(
        key: ValueKey(field.id),
        initialValue: field.value,
        onSaved: onSaved,
        builder: (state) => CheckboxListTile(
          title: Text(field.name),
          value: state.value ?? false,
          onChanged: (value) {
            if (value != null) _toggle(state, value);
          },
        ),
      ),
    );
  }

  /// チェック状態切り替え
  ///
  /// - [state] フィールド状態
  /// - [value] 値
  void _toggle(FormFieldState<bool> state, bool value) {
    state.didChange(value);
    onChanged?.call(value);
  }
}
