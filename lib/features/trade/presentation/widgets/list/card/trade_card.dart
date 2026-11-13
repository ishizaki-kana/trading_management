import 'package:flutter/material.dart';
import 'package:trading_management/core/navigation/app_navigator.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';
import 'package:trading_management/features/trade/presentation/screens/trade_detail_screen.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/info/date_location_info/trade_date_location_info.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/info/memo/trade_memo.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/next_stage_button/trade_next_stage_button.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/stage_indicator/trade_stage_indicator.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/trade_chip/trade_chip.dart';
import 'package:trading_management/features/trade/presentation/widgets/common/trade_target/trade_target.dart';

/// 取引カード
///
/// 取引の概要を表示するカードを表示します。
/// カードタップで取引詳細画面に画面遷移します。
///
/// - [trade] 取引データ
/// - [onReturned] 詳細画面から戻ったときのコールバック
/// - [onUpdated] ステージ更新時のコールバック
class TradeCard extends StatelessWidget {
  //
  // fields
  //

  /// 取引データ
  final TradeSummary trade;

  /// 詳細画面から戻ったときのコールバック
  final Future<void> Function()? onReturned;

  /// ステージ更新時のコールバック
  final Future<void> Function()? onUpdated;

  //
  // constructor
  //

  const TradeCard({
    super.key,
    required this.trade,
    this.onReturned,
    this.onUpdated,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 取引ステージリスト
    final stages = TradeStageResolver.resolveStates(
      tradeType: trade.tradeType,
      deliveryType: trade.deliveryType,
      isPrepaid: trade.isPrepaid,
    );

    return SectionCard(
      onTap: () async {
        await AppNavigator.push(
          context,
          TradeDetailScreen(tradeId: trade.tradeId),
        );

        if (context.mounted) {
          await onReturned?.call();
        }
      },
      color: theme.colorScheme.surfaceContainer,
      // 取引種別・受渡種別
      leading: Padding(
        padding: const EdgeInsets.only(right: AppSpacing.s8),
        child: TradeChip(
          tradeType: trade.tradeType,
          deliveryType: trade.deliveryType,
        ),
      ),
      title: ' ${trade.partner?.username}（@${trade.partner?.userId}） さん',
      child: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.s16,
          children: [
            // 取引対象
            TradeTarget(
              offerItem: trade.offerItem,
              wantedItem: trade.wantedItem,
              tradeType: trade.tradeType,
            ),
            // 取引ステータス
            TradeStageIndicator(
              stages: stages,
              completedStages: trade.completedStages,
            ),
            Column(
              spacing: AppSpacing.s12,
              children: [
                const SizedBox(height: AppSpacing.s4),
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
            // 取引ステージ進行ボタン
            TradeNextStageButton(
              tradeId: trade.tradeId,
              stages: stages,
              completedStages: trade.completedStages,
              onUpdate: onUpdated ?? onReturned,
            ),
          ],
        ),
      ),
    );
  }
}
