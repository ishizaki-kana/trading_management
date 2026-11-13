import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/info/date_location_info/trade_date_location_info.dart';

const _group = 'trade/detail/date_location_info';

@AppPreview(group: _group, name: 'Date and location', size: Size(360, 190))
Widget tradeDateLocationInfoDateAndLocationPreview() {
  return _buildPreview(tradedAt: DateTime(2026, 11, 9), location: '東京駅 中央改札前');
}

@AppPreview(group: _group, name: 'Date only', size: Size(360, 190))
Widget tradeDateLocationInfoDatePreview() {
  return _buildPreview(tradedAt: DateTime(2026, 11, 9));
}

@AppPreview(group: _group, name: 'Location only', size: Size(360, 190))
Widget tradeDateLocationInfoLocationPreview() {
  return _buildPreview(location: '東京駅 中央改札前');
}

@AppPreview(group: _group, name: 'Shipping (hidden)', size: Size(360, 190))
Widget tradeDateLocationInfoShippingPreview() {
  return _buildPreview(
    deliveryType: DeliveryType.shipping,
    tradedAt: DateTime(2026, 11, 9),
    location: '東京駅 中央改札前',
  );
}

Widget _buildPreview({
  DeliveryType deliveryType = DeliveryType.handoff,
  DateTime? tradedAt,
  String? location,
}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: TradeDateLocationInfo(
        deliveryType: deliveryType,
        tradedAt: tradedAt,
        location: location,
      ),
    ),
  );
}
