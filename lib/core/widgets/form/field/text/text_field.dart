import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/form/validation/app_validator.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';

/// テキスト入力ボックス
///
/// - [controller] コントローラー
/// - [field] フィールド
/// - [keyboardType] タイプ
/// - [hintText] ヒントテキスト
/// - [prefix] 左側装飾
/// - [suffix] 右側装飾
/// - [showLabel] ラベルを表示するかどうか
/// - [isReadOnly] 読み取り専用かどうか
/// - [isMultiline] 複数行入力できるかどうか
/// - [validator] バリデータ
/// - [onSaved] 入力値保存時のコールバック
class AppTextField extends StatelessWidget {
  //
  // fields
  //

  /// フィールド
  final AppFormField<String> field;

  /// コントローラー
  final TextEditingController? controller;

  /// タイプ
  final TextInputType? keyboardType;

  ///　ヒントテキスト
  final String? hintText;

  /// 左側装飾
  final Widget? prefix;

  /// 右側装飾
  final Widget? suffix;

  /// ラベルを表示するかどうか
  final bool showLabel;

  /// 読み取り専用かどうか
  final bool isReadOnly;

  /// 複数行入力できるかどうか
  final bool isMultiline;

  /// バリデーター
  final FormFieldValidator<String>? validator;

  /// 入力値保存時のコールバック
  final FormFieldSetter<String>? onSaved;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  //
  // constructor
  //

  const AppTextField(
    this.field, {
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.prefix,
    this.suffix,
    this.validator,
    this.showLabel = true,
    this.isReadOnly = false,
    this.isMultiline = false,
    this.onSaved,
    this.onTap,
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
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          initialValue: controller == null ? field.value : null,
          readOnly: isReadOnly,
          maxLines: isMultiline ? null : 1,
          minLines: isMultiline ? 5 : 1,
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefix == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 12, right: 4),
                    child: prefix,
                  ),
            suffixIcon: suffix,
          ),
          errorBuilder: (context, errorText) {
            return Transform.translate(
              offset: const Offset(-8, 0),
              child: Text(
                errorText,
                softWrap: true,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            );
          },
          validator: _validate,
          onSaved: onSaved,
          onTap: onTap,
        ),
      ],
    );
  }

  //
  // private methods
  //

  /// バリデーション
  ///
  /// - [value] 入力値
  String? _validate(String? value) {
    final target = field.copyWith(value: value ?? '');

    // 必須入力
    if (field.isRequired) {
      final result = AppValidator.required(target);
      if (result.isFailed) return result.error;
    }

    // 最小値
    if (field.min != null) {
      final result = AppValidator.min(target);
      if (result.isFailed) return result.error;
    }

    // 最大値
    if (field.max != null) {
      final result = AppValidator.max(target);
      if (result.isFailed) return result.error;
    }

    // 入力制限
    if (field.allowedCharacterTypes != null) {
      final result = AppValidator.allowedCharacters(target);
      if (result.isFailed) return result.error;
    }

    return validator?.call(value);
  }
}
