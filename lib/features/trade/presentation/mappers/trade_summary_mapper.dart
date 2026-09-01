import 'package:trading_management/features/trade/domain/entities/delivery_type.dart';
import 'package:trading_management/features/trade/domain/entities/trade.dart';
import 'package:trading_management/features/trade/domain/entities/trade_stage.dart';
import 'package:trading_management/features/trade/domain/entities/trade_type.dart';
import 'package:trading_management/features/trade/presentation/models/trade_summary.dart';

/// 取引エンティティ変換クラス
class TradeSummaryMapper {
  TradeSummaryMapper._(); // インスタンス化禁止

  /// 取引概要ビューモデル変換
  ///
  /// 取引エンティティを取引概要ビューモデルへ変換します。
  ///
  /// - [trade]　取引エンティティ
  static TradeSummary toTradeSummary(Trade trade) {
    final TradeType tradeType = TradeType.fromCode(trade.tradeTypeId);
    final DeliveryType deliveryType = DeliveryType.fromCode(
      trade.deliveryTypeId,
    );
    final List<TradeStage> completedStages = trade.completedStageCodes != null
        ? trade.completedStageCodes!.map((s) => TradeStage.fromCode(s)).toList()
        : [];

    return TradeSummary(
      tradeId: trade.tradeId,
      partnerText: '${trade.partner.userId}（@${trade.partner.username}） さん',
      tradeType: tradeType,
      deliveryType: deliveryType,
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
