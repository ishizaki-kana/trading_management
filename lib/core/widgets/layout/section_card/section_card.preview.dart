import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';

@AppPreview(group: 'layout/section_card')
Widget sectionCardPreview() {
  return const Scaffold(
    body: Padding(
      padding: EdgeInsets.all(16),
      child: SectionCard(
        title: 'セクションタイトル',
        child: Text('カード内のコンテンツ'),
      ),
    ),
  );
}
