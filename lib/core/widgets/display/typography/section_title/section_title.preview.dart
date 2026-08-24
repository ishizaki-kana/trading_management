import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

const _group = 'display/typography/section_title';

@AppPreview(group: _group)
Widget preview() {
  return const Scaffold(
    body: Center(child: SectionTitle(text: 'text')),
  );
}
