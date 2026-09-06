import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';
import 'package:trading_management/features/trade/presentation/view_models/trade_summary.dart';

/// 取引エンティティ変換クラス
class TradeMapper {
  TradeMapper._(); // インスタンス化禁止

  /// 取引概要ビューモデル変換
  ///
  /// 取引エンティティを取引概要ビューモデルへ変換します。
  ///
  /// - [trade]　取引エンティティ
  /// - [partner] 取引相手エンティティ
  /// - [stages] 取引ステージ
  static TradeSummary toTradeSummary(
    Trade trade,
    Partner? partner,
    List<int> stages,
  ) {
    final List<TradeStage> completedStages = stages
        .map((s) => TradeStage.fromCode(s))
        .toList();

    return TradeSummary(
      tradeId: trade.tradeId,
      partnerText: partner != null
          ? '${partner.userId}（@${partner.username}） さん'
          : '',
      tradeType: TradeType.fromCode(trade.tradeTypeId),
      deliveryType: DeliveryType.fromCode(trade.deliveryTypeId),
      offerItem: TradeItem(
        itemName: trade.offerItem,
        imageUrl: trade.offerItemImageUrl,
      ),
      wantedItem: TradeItem(
        itemName: trade.wantedItem,
        imageUrl: trade.wantedItemImageUrl,
      ),
      completedStages: completedStages,
      isPrepaid: trade.isPrepaid,
      memo: trade.memo,
    );
  }
}
