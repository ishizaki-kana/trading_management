import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/home/home_app_bar.dart';
import 'package:trading_management/features/trade/domain/entities/trade.dart';
import 'package:trading_management/features/trade/presentation/mappers/trade_summary_mapper.dart';
import 'package:trading_management/features/trade/presentation/models/trade_summary.dart';
import 'package:trading_management/features/trade/presentation/widgets/trade_list.dart';

/// ホーム画面
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<TradeSummary> tradeList = dummyTradeList
      .map((t) => TradeSummaryMapper.toTradeSummary(t))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s24,
        ),
        child: TradeList(tradeList: tradeList),
      ),
    );
  }
}
