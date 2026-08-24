import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/typography/caption/caption.dart';

const _group = 'display/typography/caption';

@AppPreview(group: _group)
Widget preview() {
  return const Scaffold(
    body: Center(child: Caption(text: 'text')),
  );
}
