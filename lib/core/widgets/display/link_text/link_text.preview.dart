import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/link_text/link_text.dart';

const _group = 'display/link_text';

@AppPreview(group: _group)
Widget linkTextPreview() {
  return const Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: LinkText(
          text: '@sample_user さん',
          uri: 'https://x.com/sample_user',
        ),
      ),
    ),
  );
}
