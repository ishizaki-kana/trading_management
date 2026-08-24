import 'package:flutter/material.dart';

/// テキスト入力ボックス
///
/// - [controller] 入力値を管理するコントローラー
/// - [label] ラベル
/// - [required] 必須入力にするかどうか
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool required;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.required = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: _validate,
    );
  }

  /// バリデーション
  ///
  /// - [value] 入力値
  String? _validate(String? value) {
    if (required && (value == null || value.isEmpty)) {
      return '$labelを入力してください。';
    }
    return null;
  }
}
