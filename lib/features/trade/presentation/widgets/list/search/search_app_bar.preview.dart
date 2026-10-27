import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/presentation/widgets/list/search/search_app_bar.dart';

@AppPreview(group: 'trade/list/search')
Widget searchAppBarPreview() {
  return Scaffold(
    appBar: TradeSearchAppBar(onChanged: (_) {}),
    body: const SizedBox(),
  );
}
