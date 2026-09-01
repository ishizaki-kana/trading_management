import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/image/placeholder/image_placeholder.dart';

const _group = 'display/image/placeholder';

@AppPreview(group: _group, size: Size(360, 190))
Widget preview() {
  return const Scaffold(
    body: Center(child: ImagePlaceholder(width: 120, height: 120)),
  );
}
