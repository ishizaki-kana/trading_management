import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/bottom_navigation_bar/app_bottom_navigation_bar.dart';

const _group = 'layout/bottom_navigation_bar';

@AppPreview(group: _group, size: Size(360, 200))
Widget appBottomNavigationBarPreview() {
  return const Scaffold(
    body: Center(child: Text('コンテンツ')),
    bottomNavigationBar: AppBottomNavigationBar(),
  );
}
