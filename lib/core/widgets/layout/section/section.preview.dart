import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/section/section.dart';

@AppPreview(group: 'layout/section')
Widget sectionPreview() {
  return const Scaffold(
    body: Section(
      title: 'セクションタイトル',
      child: Text('セクションのコンテンツ'),
    ),
  );
}
