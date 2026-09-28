import 'package:flutter/material.dart';
import 'package:trading_management/core/navigation/app_navigator.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/conditions/trade_display_conditions.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';
import 'package:trading_management/features/trade/presentation/formatter/trade_formatter.dart';
import 'package:trading_management/features/trade/presentation/screens/trade_detail_screen.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/stage_indicator/trade_stage_indicator.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/trade_chip/trade_chip.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/trade_target/trade_target.dart';

/// 取引カード
///
/// 取引の概要を表示するカードを表示します。
/// カードタップで取引詳細画面に画面遷移します。
///
/// - [trade] 取引データ
class TradeCard extends StatelessWidget {
  //
  // fields
  //

  /// 取引データ
  final TradeSummary trade;

  //
  // constructor
  //

  const TradeCard({super.key, required this.trade});

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
      onTap: () =>
          AppNavigator.push(context, TradeDetailScreen(tradeId: trade.tradeId)),
      color: theme.colorScheme.surfaceContainer,
      // 取引種別・受渡種別
      leading: Padding(
        padding: const EdgeInsets.only(right: AppSpacing.s8),
        child: TradeChip(
          tradeType: trade.tradeType,
          deliveryType: trade.deliveryType,
        ),
      ),
      title: ' ${trade.partnerUsername}（@${trade.partnerUserId}） さん',
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
                _buildDateLocationCard(theme),
                // メモ
                _buildMemoCard(theme),
              ],
            ),
            // 取引ステージ進行ボタン
            _buildNextStageButton(stages),
          ],
        ),
      ),
    );
  }

  //
  // private methods
  //

  /// 取引日時・場所カード作成
  ///
  /// - [theme] テーマ
  Widget _buildDateLocationCard(ThemeData theme) {
    final deliveryType = trade.deliveryType;
    final tradedAt = trade.tradedAt;
    final location = trade.location;

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

  /// メモカード作成
  ///
  /// - [theme] テーマ
  Widget _buildMemoCard(ThemeData theme) {
    if (TradeDisplayConditions.shouldDisplayMemo(memo: trade.memo)) {
      return SectionCard(title: 'メモ', child: Text(trade.memo!));
    } else {
      return const SizedBox.shrink();
    }
  }

  /// 取引ステージ進行ボタン作成
  ///
  /// - [stages] 取引ステージリスト
  Widget _buildNextStageButton(List<TradeStage> stages) {
    final nextStage = TradeStageResolver.resolveNextStage(
      stages: stages,
      completedStages: trade.completedStages,
    );

    /// 取引終了済みのとき、ボタンを表示しない
    if (nextStage == null) {
      return const SizedBox.shrink();
    }

    return AppButton(
      text: '${nextStage.label} にする',
      isFullWidth: true,
      onPressed: () {},
    );
  }
}
