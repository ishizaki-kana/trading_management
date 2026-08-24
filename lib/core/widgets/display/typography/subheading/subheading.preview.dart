import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/typography/subheading/subheading.dart';

const _group = 'display/typography/subheading';

@AppPreview(group: _group)
Widget preview() {
  return const Scaffold(
    body: Center(child: Subheading(text: 'text')),
  );
}
