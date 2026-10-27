import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/field/text/character_type.dart';
import 'package:trading_management/core/widgets/form/field/text/text_field.dart';

const _group = 'form/field/text';

@AppPreview(group: _group, name: 'Default', size: Size(360, 190))
Widget appTextFieldDefaultPreview() {
  return _buildPreview(
    const AppTextField(
      AppFormField(id: 'trade_name', name: '取引名', value: ''),
      hintText: '取引名を入力',
    ),
  );
}

@AppPreview(group: _group, name: 'Validation', size: Size(360, 640))
Widget appTextFieldValidationPreview() {
  return Scaffold(
    body: Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AppTextField(
            AppFormField(
              id: 'trade_name',
              name: '取引名（必須）',
              value: '',
              isRequired: true,
            ),
          ),
          SizedBox(height: 12),
          AppTextField(
            AppFormField(
              id: 'user_id_min',
              name: 'ユーザーID（3文字以上）',
              value: 'ab',
              min: 3,
            ),
          ),
          SizedBox(height: 12),
          AppTextField(
            AppFormField(
              id: 'memo',
              name: 'メモ（10文字以下）',
              value: '12345678901',
              max: 10,
            ),
          ),
          SizedBox(height: 12),
          AppTextField(
            AppFormField(
              id: 'user_id_characters',
              name: 'ユーザーID（半角英数・_）',
              value: 'sample!',
              allowedCharacterTypes: [
                CharacterType.alphanumeric,
                CharacterType.underscore,
              ],
            ),
          ),
          SizedBox(height: 12),
          AppTextField(
            AppFormField(id: 'trade_name_custom', name: '取引名', value: 'テスト'),
            validator: _validateTradeName,
          ),
        ],
      ),
    ),
  );
}

@AppPreview(group: _group, name: 'With prefix and suffix', size: Size(360, 190))
Widget appTextFieldEmailPreview() {
  return _buildPreview(
    const AppTextField(
      AppFormField(id: 'email', name: 'メールアドレス', value: ''),
      hintText: 'example@email.com',
      prefix: Icon(Icons.email_outlined),
      suffix: Icon(Icons.check_circle_outline),
      keyboardType: TextInputType.emailAddress,
    ),
  );
}

@AppPreview(group: _group, name: 'Read only', size: Size(360, 190))
Widget appTextFieldReadOnlyPreview() {
  return _buildPreview(
    const AppTextField(
      AppFormField(id: 'partner', name: '取引相手', value: 'sample_user'),
      prefix: Text('@'),
      isReadOnly: true,
    ),
  );
}

@AppPreview(group: _group, name: 'Multiline', size: Size(360, 260))
Widget appTextFieldMultilinePreview() {
  return _buildPreview(
    const AppTextField(
      AppFormField(id: 'memo', name: 'メモ', value: '取引当日は東京駅の中央改札前で待ち合わせます。'),
      isMultiline: true,
    ),
  );
}

String? _validateTradeName(String? value) {
  if (value == 'テスト') return '「テスト」は使用できません。';
  return null;
}

Widget _buildPreview(AppTextField textField) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(child: textField),
    ),
  );
}
