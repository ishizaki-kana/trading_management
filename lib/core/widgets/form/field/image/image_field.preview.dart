import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/field/image/image_field.dart';

const _group = 'form/field/image';

@AppPreview(group: _group, name: 'Placeholder', size: Size(360, 250))
Widget imageFieldPlaceholderPreview() {
  return _buildPreview(
    const AppFormField<Uint8List?>(id: 'image', name: '画像', value: null),
  );
}

@AppPreview(group: _group, name: 'With image', size: Size(360, 250))
Widget imageFieldWithImagePreview() {
  return _buildPreview(
    AppFormField(id: 'image', name: '画像', value: _sampleImage),
  );
}

Uint8List get _sampleImage => base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGP4z8DwHwAFAAH/iZk9HQAAAABJRU5ErkJggg==',
);

Widget _buildPreview(
  AppFormField<Uint8List?> field, {
  double width = 160,
  double height = 160,
}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: ImageField(field, width: width, height: height),
    ),
  );
}
