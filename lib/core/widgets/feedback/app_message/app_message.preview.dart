import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/feedback/app_message/app_message.dart';

const _group = 'feedback/app_message';

@AppPreview(group: _group, name: 'With icon')
Widget appMessagePreview() {
  return const Scaffold(
    body: AppMessage(icon: Icons.info_outline, message: 'message'),
  );
}
