import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/features/trade/presentation/models/trade_summary.dart';
import 'package:trading_management/features/trade/presentation/widgets/trade_card.dart';

class TradeList extends StatelessWidget {
  final List<TradeSummary> tradeList;
  const TradeList({super.key, required this.tradeList});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.s20,
      children: tradeList.map((t) => TradeCard(trade: t)).toList(),
    );
  }
}
