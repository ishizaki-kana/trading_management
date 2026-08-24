import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/app_icon/app_icon.dart';

const _group = 'display/app_icon';

@AppPreview(group: _group)
Widget preview() {
  return Scaffold(body: const Center(child: AppIcon()));
}
