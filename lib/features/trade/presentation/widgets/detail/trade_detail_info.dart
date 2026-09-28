import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_string.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/link_text/link_text.dart';
import 'package:trading_management/core/widgets/layout/section/section.dart';
import 'package:trading_management/core/widgets/layout/section_card/section_card.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/domain/conditions/trade_display_conditions.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/presentation/formatter/trade_formatter.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/stage_indicator/trade_stage_indicator.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/trade_chip/trade_chip.dart';
import 'package:trading_management/features/trade/presentation/widgets/info/trade_target/trade_target.dart';

/// 取引詳細情報
///
/// - [trade] 取引データ
class TradeDetailInfo extends StatelessWidget {
  //
  // fields
  //

  /// 取引データ
  final TradeDetail trade;

  /// 取引ステージリスト
  final List<TradeStage> stages;

  //
  // constructor
  //

  const TradeDetailInfo({super.key, required this.trade, required this.stages});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Column(
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
        TradeChip(tradeType: trade.tradeType, deliveryType: trade.deliveryType),
        // 取引相手
        _buildPartnerInfo(),
        //　取引日時・場所
        _buildDateLocationInfo(),
        // メモ
        _buildMemo(),
      ],
    );
  }

  //
  // private methods
  //

  /// 取引日時・場所情報作成
  Widget _buildDateLocationInfo() {
    final deliveryType = trade.deliveryType;
    final tradedAt = trade.tradedAt;
    final location = trade.location;

    if (TradeDisplayConditions.shouldDisplayLocation(
      deliveryType: deliveryType,
      tradedAt: trade.tradedAt,
      location: trade.location,
    )) {
      final dateLocation = TradeFormatter.formatDateLocation(
        tradedAt: tradedAt,
        location: location,
      );

      return Section(title: '取引日時 / 場所', child: Text(dateLocation));
    } else {
      return const SizedBox.shrink();
    }
  }

  /// 取引相手情報作成
  ///
  Widget _buildPartnerInfo() {
    final userId = trade.partnerUserId!;
    final username = trade.partnerUsername!;

    if (TradeDisplayConditions.shouldDisplayPartner(partnerUserId: userId)) {
      return SectionCard(
        title: '取引相手',
        child: LinkText(
          text: '$username さん',
          uri: '${AppString.xDomain}$userId',
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  /// メモ作成
  Widget _buildMemo() {
    final memo = trade.memo;

    if (TradeDisplayConditions.shouldDisplayMemo(memo: memo)) {
      return Section(title: 'メモ', child: Text(memo!));
    } else {
      return const SizedBox.shrink();
    }
  }
}
