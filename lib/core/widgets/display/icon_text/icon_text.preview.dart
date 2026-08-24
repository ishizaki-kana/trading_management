import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/icon_text/icon_text.dart';

const _group = 'display/icon_text';

@AppPreview(group: _group)
Widget preview() {
  return const Scaffold(
    body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
        child: IconText(icon: Icon(Icons.tag_faces_rounded), text: 'text'),
      ),
    ),
  );
}
