import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';
import 'package:trading_management/features/trade/presentation/widgets/detail/info/trade_detail_info.dart';

const _group = 'trade/detail/info';

@AppPreview(group: _group, name: 'Handoff', size: Size(390, 760))
Widget tradeDetailInfoHandoffPreview() {
  return _buildPreview(
    trade: TradeDetail(
      tradeId: 'trade-handoff',
      partner: PartnerDetail(
        partnerId: 'partner1',
        userId: 'sample_user',
        username: 'サンプルユーザー',
      ),
      tradeType: TradeType.exchange,
      deliveryType: DeliveryType.handoff,
      offerItem: const TradeItem(itemName: '譲るアイテム'),
      wantedItem: const TradeItem(itemName: '受け取るアイテム'),
      completedStages: const [TradeStage.agreed],
      tradedAt: DateTime(2026, 9, 28),
      location: '東京駅 中央改札前',
      isPrepaid: false,
      memo: '当日は中央改札前で待ち合わせます。',
    ),
    stages: const [TradeStage.agreed, TradeStage.completed],
  );
}

@AppPreview(group: _group, name: 'Shipping', size: Size(390, 760))
Widget tradeDetailInfoShippingPreview() {
  return _buildPreview(
    trade: const TradeDetail(
      tradeId: 'trade-shipping',
      partner: PartnerDetail(
        partnerId: 'partner1',
        userId: 'sample_user',
        username: 'サンプルユーザー',
      ),
      tradeType: TradeType.transfer,
      deliveryType: DeliveryType.shipping,
      offerItem: TradeItem(itemName: '譲るアイテム'),
      wantedItem: TradeItem(),
      completedStages: [TradeStage.agreed, TradeStage.paymentReceived],
      tradedAt: null,
      location: null,
      isPrepaid: true,
      memo: '入金確認後に発送します。',
    ),
    stages: const [
      TradeStage.agreed,
      TradeStage.paymentReceived,
      TradeStage.shipped,
      TradeStage.completed,
    ],
  );
}

Widget _buildPreview({
  required TradeDetail trade,
  required List<TradeStage> stages,
}) {
  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: TradeDetailInfo(trade: trade, stages: stages),
    ),
  );
}
