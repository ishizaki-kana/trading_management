import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/feedback/message/message.dart';

const _group = 'feedback/message';

@AppPreview(group: _group, name: 'With icon')
Widget messagePreview() {
  return const Scaffold(
    body: Message(icon: Icons.info_outline, message: 'message'),
  );
}
