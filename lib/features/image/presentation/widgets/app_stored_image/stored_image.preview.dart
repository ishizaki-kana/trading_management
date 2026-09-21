import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/image/presentation/widgets/app_stored_image/stored_image.dart';

const _group = 'image/app_stored_image';

final _imageBytes = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR4nGP4z8DwHwAFAAH/iZk9HQAAAABJRU5ErkJggg==',
);

@AppPreview(group: _group, name: 'Placeholder', size: Size(360, 190))
Widget appStoredImagePlaceholderPreview() {
  return const Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: AppStoredImage(imageBytes: null, width: 120, height: 120),
      ),
    ),
  );
}

@AppPreview(group: _group, name: 'Image', size: Size(360, 190))
Widget appStoredImagePreview() {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: AppStoredImage(imageBytes: _imageBytes, width: 120, height: 120),
      ),
    ),
  );
}

@AppPreview(group: _group, name: 'Rounded', size: Size(360, 190))
Widget appStoredImageRoundedPreview() {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: AppStoredImage(
          imageBytes: _imageBytes,
          width: 120,
          height: 120,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
