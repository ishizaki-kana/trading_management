import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/presentation/widgets/search/search_app_bar.dart';

@AppPreview(group: 'trade/search')
Widget searchAppBarPreview() {
  return Scaffold(
    appBar: TradeSearchAppBar(onChanged: (_) {}),
    body: const SizedBox(),
  );
}
