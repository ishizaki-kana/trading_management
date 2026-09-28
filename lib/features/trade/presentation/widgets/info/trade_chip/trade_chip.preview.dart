import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/trade_chip/trade_chip.dart';

const _group = 'trade/trade_chip';

@AppPreview(group: _group, name: 'Exchange / Handoff')
Widget tradeChipExchangeHandoffPreview() {
  return _buildPreview(TradeType.exchange, DeliveryType.handoff);
}

@AppPreview(group: _group, name: 'Exchange / Shipping')
Widget tradeChipExchangeShippingPreview() {
  return _buildPreview(TradeType.exchange, DeliveryType.shipping);
}

@AppPreview(group: _group, name: 'Transfer / Handoff')
Widget tradeChipTransferHandoffPreview() {
  return _buildPreview(TradeType.transfer, DeliveryType.handoff);
}

@AppPreview(group: _group, name: 'Transfer / Shipping')
Widget tradeChipTransferShippingPreview() {
  return _buildPreview(TradeType.transfer, DeliveryType.shipping);
}

@AppPreview(group: _group, name: 'Purchase / Handoff')
Widget tradeChipPurchaseHandoffPreview() {
  return _buildPreview(TradeType.purchase, DeliveryType.handoff);
}

@AppPreview(group: _group, name: 'Purchase / Shipping')
Widget tradeChipPurchaseShippingPreview() {
  return _buildPreview(TradeType.purchase, DeliveryType.shipping);
}

Widget _buildPreview(TradeType tradeType, DeliveryType deliveryType) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: TradeChip(tradeType: tradeType, deliveryType: deliveryType),
      ),
    ),
  );
}
