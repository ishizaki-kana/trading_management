import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';
import 'package:trading_management/features/trade/domain/services/trade_service.dart';
import 'package:trading_management/features/trade/presentation/view_models/trade_summary.dart';
import 'package:trading_management/features/trade/presentation/widgets/search/search_app_bar.dart';
import 'package:trading_management/features/trade/presentation/widgets/trade_list.dart';

/// ホーム画面
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// 取引リスト
  List<TradeSummary>? _trades;

  /// 検索条件
  TradeSearchConditions _conditions = const TradeSearchConditions();

  /// 最新のリクエストID
  int _currentRequestId = 0;

  /// エラー
  Object? _error;

  /// 読み込み処理を開始済みかどうか
  bool _isLoadStarted = false;

  ///　読み込み中かどうか
  bool _isLoading = false;

  ///　初期化
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 初回のみ読み込み処理を開始する
    if (_isLoadStarted) {
      return;
    }
    _isLoadStarted = true;
    _loadTrades();
  }

  /// 取引リスト取得
  Future<void> _loadTrades() async {
    final requestId = ++_currentRequestId;
    final conditions = _conditions;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService(database);

    try {
      final trades = await tradeService.getTrades(conditions);

      if (!mounted || requestId != _currentRequestId) {
        return;
      }

      setState(() {
        _trades = trades;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted || requestId != _currentRequestId) {
        return;
      }

      setState(() {
        _error = error;
        _isLoading = false;
      });
    }
  }

  /// 検索条件を更新
  void _searchTrades(TradeSearchConditions conditions) {
    setState(() {
      _conditions = conditions;
    });
    _loadTrades();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      isLoading: _isLoading,
      error: _error?.toString(),
      appBar: TradeSearchAppBar(onChanged: _searchTrades),
      child: TradeList(tradeList: _trades ?? const []),
    );
  }
}
