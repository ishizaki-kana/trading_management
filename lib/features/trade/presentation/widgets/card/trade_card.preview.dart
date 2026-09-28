import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';
import 'package:trading_management/features/trade/presentation/widgets/card/trade_card.dart';

const _group = 'trade/card';

@AppPreview(group: _group, name: 'Exchange', size: Size(390, 760))
Widget tradeCardExchangePreview() {
  return _buildPreview(
    const TradeSummary(
      tradeId: 'trade-exchange',
      partnerUserId: 'sample_user',
      partnerUsername: 'サンプルユーザー',
      tradeType: TradeType.exchange,
      deliveryType: DeliveryType.handoff,
      offerItem: TradeItem(itemName: '譲るアイテム'),
      wantedItem: TradeItem(itemName: '受け取るアイテム'),
      completedStages: [TradeStage.agreed],
      tradedAt: null,
      location: '東京駅',
      isPrepaid: false,
      memo: '取引場所は改札前を予定しています。',
    ),
  );
}

@AppPreview(group: _group, name: 'Transfer', size: Size(390, 760))
Widget tradeCardTransferPreview() {
  return _buildPreview(
    const TradeSummary(
      tradeId: 'trade-transfer',
      partnerUserId: 'sample_user',
      partnerUsername: 'サンプルユーザー',
      tradeType: TradeType.transfer,
      deliveryType: DeliveryType.shipping,
      offerItem: TradeItem(itemName: '譲るアイテム'),
      wantedItem: TradeItem(),
      completedStages: [
        TradeStage.agreed,
        TradeStage.paymentReceived,
      ],
      tradedAt: null,
      location: null,
      isPrepaid: true,
      memo: '入金確認後に発送します。',
    ),
  );
}

@AppPreview(group: _group, name: 'Purchase', size: Size(390, 760))
Widget tradeCardPurchasePreview() {
  return _buildPreview(
    const TradeSummary(
      tradeId: 'trade-purchase',
      partnerUserId: 'sample_user',
      partnerUsername: 'サンプルユーザー',
      tradeType: TradeType.purchase,
      deliveryType: DeliveryType.shipping,
      offerItem: TradeItem(),
      wantedItem: TradeItem(itemName: '買い取るアイテム'),
      completedStages: [],
      tradedAt: null,
      location: null,
      isPrepaid: false,
      memo: null,
    ),
  );
}

Widget _buildPreview(TradeSummary trade) {
  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: TradeCard(trade: trade),
    ),
  );
}
