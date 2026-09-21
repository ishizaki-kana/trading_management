import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/application/services/trade_service.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';
import 'package:trading_management/features/trade/presentation/widgets/card/trade_card.dart';
import 'package:trading_management/features/trade/presentation/widgets/search/search_app_bar.dart';

/// 取引一覧画面
class TradeListScreen extends StatefulWidget {
  //
  // constructor
  //

  const TradeListScreen({super.key});

  //
  // public methods
  //

  @override
  State<TradeListScreen> createState() => _TradeListScreenState();
}

class _TradeListScreenState extends State<TradeListScreen> {
  //
  // fields
  //

  /// 取引リスト
  List<TradeSummary> _trades = [];

  /// 検索条件
  TradeSearchConditions _conditions = const TradeSearchConditions();

  /// 最新のリクエストID
  int _currentRequestId = 0;

  /// メッセージ
  String? _message;

  /// 読み込み処理を開始済みかどうか
  bool _isLoadStarted = false;

  ///　読み込み中かどうか
  bool _isLoading = false;

  //
  // public methods
  //

  ///　初期化
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 初回のみ読み込み処理を開始する
    if (_isLoadStarted) {
      return;
    }
    _isLoadStarted = true;
    _loadTrades(_conditions);
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      isLoading: _isLoading,
      error: _message?.toString(),
      appBar: TradeSearchAppBar(onChanged: _searchTrades),
      child: _buildTradeList(_trades),
    );
  }

  //
  // private methods
  //

  /// 取引リスト取得
  Future<void> _loadTrades(TradeSearchConditions conditions) async {
    final requestId = ++_currentRequestId;

    // ローディング状態・画面メッセージ初期化
    setState(() {
      _conditions = conditions;
      _isLoading = true;
      _message = null;
    });

    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService.fromDatabase(database);

    try {
      final trades = await tradeService.getTrades(conditions);

      if (!mounted || requestId != _currentRequestId) {
        return;
      }

      setState(() {
        _trades = trades;
        _message = trades.isEmpty ? 'メッセージ' : null;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted || requestId != _currentRequestId) {
        return;
      }

      setState(() {
        _message = error.toString();
        _isLoading = false;
      });
    }
  }

  /// 検索条件更新
  void _searchTrades(TradeSearchConditions conditions) {
    _loadTrades(conditions);
  }

  Widget _buildTradeList(List<TradeSummary> trades) {
    return Column(
      spacing: AppSpacing.s20,
      children: trades.map((t) => TradeCard(trade: t)).toList(),
    );
  }
}
