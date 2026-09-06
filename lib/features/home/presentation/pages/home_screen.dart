import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/home/home_app_bar.dart';
import 'package:trading_management/features/partner/data/partner_repository.dart';
import 'package:trading_management/features/partner/domain/services/partner_service.dart';
import 'package:trading_management/features/trade/data/trade/trade_repository.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_repository.dart';
import 'package:trading_management/features/trade/domain/services/trade_service.dart';
import 'package:trading_management/features/trade/domain/services/trade_stage_history_service.dart';
import 'package:trading_management/features/trade/presentation/view_models/trade_summary.dart';
import 'package:trading_management/features/trade/presentation/widgets/trade_list.dart';

/// ホーム画面
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TradeSummary>? _tradeList;
  Object? _loadError;
  var _isLoading = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    _loadTrades();
  }

  Future<void> _loadTrades() async {
    final database = AppDatabaseScope.of(context);

    final tradeService = TradeService(
      TradeRepository(database),
      PartnerService(PartnerRepository(database)),
      TradeStageHistoryService(TradeStageHistoryRepository(database)),
    );

    try {
      final trades = await tradeService.getTrades();

      if (!mounted) {
        return;
      }

      setState(() {
        _tradeList = trades;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _loadError = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loadError != null) {
      return Center(child: Text('取引リストの取得に失敗しました。$_loadError'));
    }

    if (_tradeList == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s24,
        ),
        child: TradeList(tradeList: _tradeList!),
      ),
    );
  }
}
