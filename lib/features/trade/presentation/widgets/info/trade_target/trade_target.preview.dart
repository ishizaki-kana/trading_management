import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/trade_target/trade_target.dart';

const _group = 'trade/trade_target';

@AppPreview(group: _group, name: 'Exchange', size: Size(360, 190))
Widget tradeTargetExchangePreview() {
  return _buildPreview(
    tradeType: TradeType.exchange,
    offerItem: const TradeItem(itemName: '譲るアイテム'),
    wantedItem: const TradeItem(itemName: '受け取るアイテム'),
  );
}

@AppPreview(group: _group, name: 'Transfer', size: Size(360, 190))
Widget tradeTargetTransferPreview() {
  return _buildPreview(
    tradeType: TradeType.transfer,
    offerItem: const TradeItem(itemName: '譲るアイテム'),
    wantedItem: const TradeItem(),
  );
}

@AppPreview(group: _group, name: 'Purchase', size: Size(360, 190))
Widget tradeTargetPurchasePreview() {
  return _buildPreview(
    tradeType: TradeType.purchase,
    offerItem: const TradeItem(),
    wantedItem: const TradeItem(itemName: '買い取るアイテム'),
  );
}

Widget _buildPreview({
  required TradeType tradeType,
  required TradeItem offerItem,
  required TradeItem wantedItem,
}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: TradeTarget(
          tradeType: tradeType,
          offerItem: offerItem,
          wantedItem: wantedItem,
        ),
      ),
    ),
  );
}
