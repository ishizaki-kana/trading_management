import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/text_field/text_field.dart';

@AppPreview(group: 'form/text_field')
Widget appTextFieldPreview() {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        child: AppTextField(
          controller: TextEditingController(),
          label: 'メールアドレス',
          prefixIcon: const Icon(Icons.email_outlined),
          required: true,
        ),
      ),
    ),
  );
}
