import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/layout/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/application/services/trade_service.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';
import 'package:trading_management/features/trade/presentation/widgets/list/card/trade_card.dart';
import 'package:trading_management/features/trade/presentation/widgets/list/search/search_app_bar.dart';

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

class _TradeListScreenState extends AppPageState<TradeListScreen> {
  //
  // fields
  //

  /// 取引リスト
  List<TradeSummary> _trades = const [];

  /// 検索条件
  TradeSearchConditions _conditions = const TradeSearchConditions();

  /// 一覧のスクロール位置
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //
  // public methods
  //

  /// 初期化
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 初回のみ読み込み処理を開始
    tryStartLoading(action: () => _loadTrades(_conditions));
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      message: message,
      isLoading: isLoading,
      appBar: TradeSearchAppBar(onChanged: _searchTrades),
      body: _buildBody(),
      bottomNavigationBar: const AppBottomNavigationBar(),
      onRetry: () => _searchTrades(_conditions),
    );
  }

  //
  // private methods
  //

  /// 取引リスト取得
  ///
  /// - [conditions] 検索条件
  Future<void> _loadTrades(TradeSearchConditions conditions) async {
    // 検索条件更新
    _conditions = conditions;

    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService.fromDatabase(database);

    return runPageAction(
      action: () => tradeService.getByConditions(conditions),
      onSuccess: (trades) {
        _trades = trades;
      },
    );
  }

  /// 検索条件更新
  ///
  /// - [conditions] 検索条件
  void _searchTrades(TradeSearchConditions conditions) {
    _loadTrades(conditions);
  }

  /// ステージ更新後の一覧再読み込み
  ///
  /// ローディング画面へ置き換えずに再読み込みすることで、一覧のスクロール位置を維持します。
  Future<void> _refreshTrades() async {
    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService.fromDatabase(database);
    final trades = await tradeService.getByConditions(_conditions);

    if (!mounted) return;

    setState(() {
      _trades = trades;
    });
  }

  // ボディ作成
  Widget _buildBody() {
    return ListView.separated(
      key: const PageStorageKey('trade-list'),
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal(context),
        vertical: AppSpacing.pageVertical(context),
      ),
      itemCount: _trades.length,
      itemBuilder: (context, index) {
        return TradeCard(
          trade: _trades[index],
          onReturned: () => _loadTrades(_conditions),
          onUpdated: _refreshTrades,
        );
      },
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.s20),
    );
  }
}
