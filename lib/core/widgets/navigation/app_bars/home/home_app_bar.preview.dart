import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';

import 'home_app_bar.dart';

@AppPreview(
  group: 'navigation/app_bars/home',
  name: 'HomeAppBar',
)
Widget homeAppBarPreview() {
  return const Scaffold(
    appBar: HomeAppBar(),
    body: SizedBox(),
  );
}
