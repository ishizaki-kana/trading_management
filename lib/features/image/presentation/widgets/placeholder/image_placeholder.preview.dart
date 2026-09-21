import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/image/presentation/widgets/placeholder/image_placeholder.dart';

const _group = 'image/placeholder';

@AppPreview(group: _group, size: Size(360, 190))
Widget preview() {
  return const Scaffold(
    body: Center(child: ImagePlaceholder(width: 120, height: 120)),
  );
}
