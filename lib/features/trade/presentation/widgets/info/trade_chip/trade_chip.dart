import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/chip/app_chip.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引チップ
///
/// 取引種別・受渡種別チップを横並びに表示します。
///
/// - [tradeType] 取引種別
/// - [deliveryType] 受渡種別
class TradeChip extends StatelessWidget {
  //
  // fields
  //

  /// 取引種別
  final TradeType tradeType;

  /// 受渡種別
  final DeliveryType deliveryType;

  //
  // constructor
  //

  const TradeChip({
    super.key,
    required this.tradeType,
    required this.deliveryType,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.s4,
      children: [
        AppChip(label: tradeType.label, color: tradeType.color), // 取引種別
        AppChip(label: deliveryType.label, color: deliveryType.color), // 受渡種別
      ],
    );
  }
}
