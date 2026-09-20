import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/text_field/text_field.dart';

const _group = 'form/text_field';

@AppPreview(group: _group, name: 'Default')
Widget appTextFieldDefaultPreview() {
  return _buildPreview(
    AppTextField(controller: TextEditingController(), label: '取引名'),
  );
}

@AppPreview(group: _group, name: 'Required')
Widget appTextFieldRequiredPreview() {
  return _buildPreview(
    AppTextField(
      controller: TextEditingController(),
      label: '取引名',
      isRequired: true,
    ),
  );
}

@AppPreview(group: _group, name: 'Email')
Widget appTextFieldEmailPreview() {
  return _buildPreview(
    AppTextField(
      controller: TextEditingController(),
      label: 'メールアドレス',
      prefixIcon: const Icon(Icons.email_outlined),
      suffixIcon: const Icon(Icons.check_circle_outline),
      keyboardType: TextInputType.emailAddress,
      isRequired: true,
    ),
  );
}

@AppPreview(group: _group, name: 'Password')
Widget appTextFieldPasswordPreview() {
  return _buildPreview(
    AppTextField(
      controller: TextEditingController(text: 'password'),
      label: 'パスワード',
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: const Icon(Icons.visibility_off_outlined),
      isObscureText: true,
    ),
  );
}

Widget _buildPreview(AppTextField textField) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(child: textField),
    ),
  );
}
