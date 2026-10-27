import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/presentation/widgets/detail/menu/detail_menu_button.dart';

const _group = 'trade/detail/menu';

@AppPreview(group: _group, size: Size(360, 200))
Widget detailMenuButtonPreview() {
  return Scaffold(
    appBar: AppBar(actions: const [DetailMenuButton()]),
    body: const Center(child: Text('詳細画面のメニュー')),
  );
}
