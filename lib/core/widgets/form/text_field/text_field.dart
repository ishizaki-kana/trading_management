import 'package:flutter/material.dart';

/// テキスト入力ボックス
///
/// - [controller] コントローラー
/// - [label] ラベル
/// - [prefixIcon] 左側アイコン
/// - [suffixIcon] 右側アイコン
/// - [keyboardType] タイプ
/// - [validator] バリデーター
/// - [isRequired] 必須入力かどうか
/// - [isObscureText] 入力文字を隠すかどうか
class AppTextField extends StatelessWidget {
  //
  // fields
  //

  /// コントローラー
  final TextEditingController controller;

  /// ラベル
  final String label;

  /// 左側アイコン
  final Widget? prefixIcon;

  /// 右側アイコン
  final Widget? suffixIcon;

  /// タイプ
  final TextInputType? keyboardType;

  /// バリデーター
  final FormFieldValidator<String>? validator;

  /// 入力必須かどうか
  final bool isRequired;

  /// 入力文字を隠すかどうか
  final bool isObscureText;

  //
  // constructor
  //

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.isRequired = false,
    this.isObscureText = false,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText,
      decoration: InputDecoration(
        label: isRequired
            ? Text.rich(
                TextSpan(
                  text: label,
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ],
                ),
              )
            : Text(label),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: _validate,
    );
  }

  //
  // private methods
  //

  /// バリデーション
  ///
  /// - [value] 入力値
  String? _validate(String? value) {
    // 必須入力
    if (isRequired && (value == null || value.trim().isEmpty)) {
      return '$labelを入力してください。';
    }

    return validator?.call(value);
  }
}
