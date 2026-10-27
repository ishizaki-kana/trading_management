import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/section/section.dart';

const _group = 'layout/section';

@AppPreview(group: _group, name: 'With title', size: Size(360, 200))
Widget sectionWithTitlePreview() {
  return _buildPreview(
    const Section(
      title: '取引相手',
      children: [Text('sample_user'), Text('@sample_id')],
    ),
  );
}

@AppPreview(group: _group, name: 'Without title', size: Size(360, 160))
Widget sectionWithoutTitlePreview() {
  return _buildPreview(const Section(children: [Text('セクションのコンテンツ')]));
}

Widget _buildPreview(Section section) {
  return Scaffold(
    body: Padding(padding: const EdgeInsets.all(16), child: section),
  );
}
