import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/utils/date_time_formatter.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';
import 'package:trading_management/core/widgets/form/chip/app_chip.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/image/presentation/widgets/app_stored_image/stored_image.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';
import 'package:trading_management/features/trade/domain/resolvers/trade_stage_resolver.dart';
import 'package:trading_management/features/trade/presentation/widgets/stage_indicator/trade_stage_indicator.dart';

/// 取引カード
///
/// 取引の概要を表示するカードを表示します。
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
    final stages = TradeStageResolver.resolve(trade: trade);

    return SectionCard(
      leading: _buildTradeChip(),
      title: '${trade.partnerUserId}（@${trade.partnerUsername}） さん',
      child: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.s16,
          children: [
            // 取引対象
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTradeItem(true, theme),
                Icon(Icons.compare_arrows_outlined),
                _buildTradeItem(false, theme),
              ],
            ),
            // 取引ステータス
            TradeStageIndicator(
              stages: stages,
              completedStages: trade.completedStages,
            ),
            // 交換日時・メモ
            _buildSectionCardList(theme),
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

  /// 取引種別・引渡種別チップ作成
  Widget _buildTradeChip() {
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
  /// - [isOffer] 譲アイテムかどうか
  /// - [theme] テーマ
  Widget _buildTradeItem(bool isOffer, ThemeData theme) {
    const size = 100.0;

    final tradeType = trade.tradeType;
    final tradeItem = isOffer ? trade.offerItem : trade.wantedItem;
    final itemName = tradeItem.itemName;
    final image = tradeItem.image;

    late final Widget content;

    if (tradeType == TradeType.purchase && isOffer ||
        tradeType == TradeType.transfer && !isOffer) {
      content = const SizedBox(
        width: size,
        height: size,
        child: Center(
          child: FaIcon(FontAwesomeIcons.sackDollar, color: Colors.amber),
        ),
      );
    } else {
      content = AppStoredImage(
        imageBytes: image?.bytes,
        width: size,
        height: size,
        borderRadius: AppRadius.sm,
      );
    }

    return Column(
      spacing: AppSpacing.s8,
      children: [
        content,
        if (itemName != null && itemName.isNotEmpty)
          AppChip(
            label: itemName,
            color: theme.scaffoldBackgroundColor,
            labelStyle: theme.textTheme.bodySmall,
          ),
      ],
    );
  }

  /// セクションカードリスト作成
  ///
  /// - [theme] テーマ
  Widget _buildSectionCardList(ThemeData theme) {
    final Map<String, String?> contents = {
      // 手渡しのとき、取引日時表示
      if (trade.deliveryType == DeliveryType.handoff)
        '取引日時 / 場所':
            '${DateTimeFormatter.formatDate(trade.tradedAt)} ${trade.location ?? ''}',
      if (trade.memo case final memo? when memo.isNotEmpty) 'メモ': memo,
    };

    if (contents.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.s12),
      child: Column(
        spacing: AppSpacing.s8,
        children: contents.entries
            .where((entry) => entry.value?.isNotEmpty == true)
            .map(
              (entry) => SectionCard(
                title: entry.key,
                color: theme.colorScheme.surfaceContainerLow,
                child: Text(entry.value!.trim()),
              ),
            )
            .toList(),
      ),
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

    final nextStage = stages.firstWhere(
      (stage) => !completedStages.contains(stage),
    );

    return AppButton(
      text: '${nextStage.label} にする',
      isFullWidth: true,
      onPressed: () {},
    );
  }
}
