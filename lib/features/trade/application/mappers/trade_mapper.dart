import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引データ変換クラス
class TradeMapper {
  TradeMapper._(); // インスタンス化禁止

  //
  // public methods
  //

  /// 取引概要モデル変換
  ///
  /// 取引データを取引概要モデルへ変換します。
  ///
  /// - [trade]　取引データ
  /// - [partner] 取引相手データ
  /// - [offerItemImage] 譲渡アイテム画像
  /// - [wantedItemImage] 希望アイテム画像
  /// - [stages] 取引ステージ
  static TradeSummary toTradeSummary(
    Trade trade,
    Partner? partner,
    StoredImage? offerItemImage,
    StoredImage? wantedItemImage,
    List<int> stages,
  ) {
    final List<TradeStage> completedStages = stages
        .map((s) => TradeStage.fromCode(s))
        .toList();

    return TradeSummary(
      tradeId: trade.tradeId,
      partnerUserId: partner?.userId,
      partnerUsername: partner?.username,
      tradeType: TradeType.fromCode(trade.tradeTypeId),
      deliveryType: DeliveryType.fromCode(trade.deliveryTypeId),
      offerItem: TradeItem(itemName: trade.offerItem, image: offerItemImage),
      wantedItem: TradeItem(itemName: trade.wantedItem, image: wantedItemImage),
      completedStages: completedStages,
      exchangeDateTime: trade.exchangeDateTime,
      isPrepaid: trade.isPrepaid,
      memo: trade.memo,
    );
  }
}
