import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/typography/heading/heading.dart';

const _group = 'display/typography/heading';

@AppPreview(group: _group)
Widget preview() {
  return const Scaffold(
    body: Center(child: Heading(text: 'text')),
  );
}
