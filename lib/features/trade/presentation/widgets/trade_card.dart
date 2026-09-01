import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/image/app_image/app_network_image.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';
import 'package:trading_management/core/widgets/form/chip/app_chip.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/trade/domain/entities/delivery_type.dart';
import 'package:trading_management/features/trade/domain/entities/trade_stage.dart';
import 'package:trading_management/features/trade/domain/entities/trade_type.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';
import 'package:trading_management/features/trade/presentation/models/trade_summary.dart';
import 'package:trading_management/features/trade/presentation/widgets/trade_stage_indicator.dart';

/// 取引カード
///
/// 取引の概要を表示するカードを表示します。
///
/// - [trade] 取引
class TradeCard extends StatelessWidget {
  final TradeSummary trade;

  const TradeCard({super.key, required this.trade});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 取引ステージリスト
    final stages = const TradeStageResolver().resolve(
      tradeType: trade.tradeType,
      deliveryType: trade.deliveryType,
      isPrepaid: trade.isPrepaid,
    );

    return SectionCard(
      title: trade.partnerText,
      titleLeading: _buildTradeChip(theme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 取引対象
          const SizedBox(height: AppSpacing.s8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTradeItem(true, theme),
              Icon(Icons.compare_arrows_outlined),
              _buildTradeItem(false, theme),
            ],
          ),

          /// 取引ステータス
          const SizedBox(height: AppSpacing.s16),
          TradeStageIndicator(
            stages: stages,
            completedStages: trade.completedStages,
          ),

          /// メモ
          const SizedBox(height: AppSpacing.s16),
          if (trade.memo != null)
            SectionCard(
              title: 'メモ',
              color: theme.colorScheme.surfaceContainerLow,
              child: Text(trade.memo!),
            ),

          /// 取引ステージ進行ボタン
          const SizedBox(height: AppSpacing.s16),
          _buildNextStageButton(stages),
        ],
      ),
    );
  }

  /// 取引種別・引渡種別チップ作成
  ///
  /// - [theme] テーマ
  Widget _buildTradeChip(ThemeData theme) {
    final TradeType tradeType = trade.tradeType;
    final DeliveryType deliveryType = trade.deliveryType;

    return Row(
      spacing: AppSpacing.s4,
      children: [
        AppChip(label: tradeType.label, color: tradeType.color), // 取引種別
        AppChip(label: deliveryType.label, color: deliveryType.color), // 受渡種別
      ],
    );
  }

  /// 取引アイテム作成
  ///
  /// - [isOffer] 譲
  /// - [theme] テーマ
  Widget _buildTradeItem(bool isOffer, ThemeData theme) {
    final TradeType tradeType = trade.tradeType;
    final TradeItem tradeItem = isOffer ? trade.offerItem : trade.wantedItem;
    final String? itemName = tradeItem.itemName;
    final String? imageUrl = tradeItem.imageUrl;
    final Widget image;

    if (tradeType == TradeType.purchase && isOffer ||
        tradeType == TradeType.transfer && !isOffer) {
      image = const SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: FaIcon(FontAwesomeIcons.sackDollar, color: Colors.amber),
        ),
      );
    } else {
      image = AppNetworkImage(
        imageUrl: imageUrl,
        width: 100,
        height: 100,
        borderRadius: AppRadius.sm,
      );
    }

    return Column(
      spacing: AppSpacing.s8,
      children: [
        image,
        if (itemName != null && itemName.isNotEmpty)
          AppChip(
            label: itemName,
            color: theme.scaffoldBackgroundColor,
            labelStyle: theme.textTheme.bodySmall,
          ),
      ],
    );
  }

  /// 取引ステージ進行ボタン作成
  ///
  /// - [stages] 取引ステージリスト
  Widget _buildNextStageButton(List<TradeStage> stages) {
    final completedStages = trade.completedStages;
    final isCompleted = completedStages.contains(TradeStage.completed);

    /// 取引終了済みのとき、ボタンを表示しない
    if (isCompleted) {
      return const SizedBox.shrink();
    }

    final nextStage = stages[completedStages.length];
    return AppButton(
      text: '${nextStage.label} にする',
      isFullWidth: true,
      onPressed: () => {},
    );
  }
}
