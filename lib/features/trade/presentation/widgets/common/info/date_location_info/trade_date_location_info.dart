import 'package:flutter/widgets.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/trade/domain/conditions/trade_display_conditions.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/presentation/formatter/trade_formatter.dart';

/// 取引日時・場所情報
///
/// - [deliveryType] 受渡種別
/// - [tradedAt] 取引日時
/// - [location] 取引場所
class TradeDateLocationInfo extends StatelessWidget {
  //
  // fields
  //

  final DeliveryType deliveryType;

  final DateTime? tradedAt;

  final String? location;

  //
  // constructor
  //

  const TradeDateLocationInfo({
    super.key,
    required this.deliveryType,
    required this.tradedAt,
    required this.location,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    if (TradeDisplayConditions.shouldDisplayLocation(
      deliveryType: deliveryType,
      tradedAt: tradedAt,
      location: location,
    )) {
      final dateLocation = TradeFormatter.formatDateLocation(
        tradedAt: tradedAt,
        location: location,
      );

      return SectionCard(title: '取引日時 / 場所', child: Text(dateLocation));
    } else {
      return const SizedBox.shrink();
    }
  }
}
