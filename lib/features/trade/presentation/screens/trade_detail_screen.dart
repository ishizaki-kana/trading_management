import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/layout/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/common/common_app_bar.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/services/trade_service.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/info/date_location_info/trade_date_location_info.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/info/memo/trade_memo.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/next_stage_button/trade_next_stage_button.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/stage_indicator/trade_stage_indicator.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/trade_chip/trade_chip.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/trade_target/trade_target.dart';
import 'package:trading_management/features/trade/presentation/widgets/detail/menu/detail_menu_button.dart';
import 'package:trading_management/features/trade/presentation/widgets/detail/partner_info/trade_partner_info.dart';

/// 取引詳細画面
///
/// - [tradeId] 取引ID
class TradeDetailScreen extends StatefulWidget {
  //
  // fields
  //

  /// 取引ID
  final String tradeId;

  //
  // constructor
  //

  const TradeDetailScreen({super.key, required this.tradeId});

  //
  // public methods
  //

  @override
  State<TradeDetailScreen> createState() => _TradeDetailScreenState();
}

class _TradeDetailScreenState extends AppPageState<TradeDetailScreen> {
  //
  // fields
  //

  /// 取引データ
  TradeDetail? _trade;

  //
  // public methods
  //

  /// 初期化
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 初回のみ読み込み処理を開始
    tryStartLoading(action: _loadTrade);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppPage(
      backgroundColor: theme.colorScheme.surface,
      message: message,
      isLoading: isLoading,
      appBar: CommonAppBar(
        actions: [DetailMenuButton(trade: _trade, onUpdated: _loadTrade)],
      ),
      body: _buildBody(),
      bottomNavigationBar: const AppBottomNavigationBar(),
      onRetry: _loadTrade,
    );
  }

  //
  // private methods
  //

  /// 取引データ取得
  Future<void> _loadTrade() async {
    final database = AppDatabaseScope.of(context);
    final tradeService = TradeService.fromDatabase(database);

    return runPageAction(
      action: () => tradeService.getById(widget.tradeId),
      onSuccess: (trade) {
        _trade = trade;
      },
    );
  }

  // ボディ作成
  Widget _buildBody() {
    if (_trade != null) {
      final trade = _trade!;
      final stages = TradeStageResolver.resolveStates(
        tradeType: trade.tradeType,
        deliveryType: trade.deliveryType,
        isPrepaid: trade.isPrepaid,
      );

      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageHorizontal(context),
                  vertical: AppSpacing.pageVertical(context),
                ),
                child: Column(
                  spacing: AppSpacing.s16,
                  children: [
                    // 取引対象
                    TradeTarget(
                      offerItem: trade.offerItem,
                      wantedItem: trade.wantedItem,
                      tradeType: trade.tradeType,
                    ),
                    // 取引ステージ
                    TradeStageIndicator(
                      stages: stages,
                      completedStages: trade.completedStages,
                    ),
                    // 取引種別・受渡種別
                    TradeChip(
                      tradeType: trade.tradeType,
                      deliveryType: trade.deliveryType,
                    ),
                    Column(
                      spacing: AppSpacing.s8,
                      children: [
                        // 取引相手
                        TradePartnerInfo(partner: trade.partner),
                        // 取引日時・場所
                        TradeDateLocationInfo(
                          deliveryType: trade.deliveryType,
                          tradedAt: trade.tradedAt,
                          location: trade.location,
                        ),
                        // メモ
                        TradeMemo(memo: trade.memo),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 取引ステージ進行ボタン
          TradeNextStageButton(
            tradeId: trade.tradeId,
            stages: stages,
            completedStages: trade.completedStages,
            isCard: false,
            onUpdate: _loadTrade,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
