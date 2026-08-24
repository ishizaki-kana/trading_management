import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/bottom_action_bar/bottom_action_bar.dart';

@AppPreview(group: 'layout/bottom_action_bar')
Widget bottomActionBarPreview() {
  return Scaffold(
    body: const Center(child: Text('Content')), 
    bottomNavigationBar: BottomActionBar(
      buttonText: '次へ',
      onPressed: () {},
    ),
  );
}
