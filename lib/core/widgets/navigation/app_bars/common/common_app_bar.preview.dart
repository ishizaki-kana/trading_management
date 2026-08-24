import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/common/common_app_bar.dart';

@AppPreview(group: 'navigation/app_bars/common')
Widget commonAppBarPreview() {
  return Scaffold(
    appBar: const CommonAppBar(
      title: 'タイトル',
      leading: Icon(Icons.arrow_back),
      actions: [Icon(Icons.more_vert)],
    ),
    body: const SizedBox(),
  );
}
