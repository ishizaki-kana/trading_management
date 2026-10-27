import 'package:drift/drift.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/partner/application/forms/partner_form.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/partner/application/models/partner_summary.dart';
import 'package:trading_management/features/trade/application/forms/trade_form.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引データ変換クラス
class TradeMapper {
  TradeMapper._(); // インスタンス化禁止

  //
  // toDto
  //

  /// 取引概要モデル変換
  ///
  /// 取引データを取引概要モデルへ変換します。
  ///
  /// - [trade]　取引データ
  /// - [partner] 取引相手概要モデル
  /// - [offerItemImage] 譲渡アイテム画像
  /// - [wantedItemImage] 希望アイテム画像
  /// - [stages] 取引ステージ
  static TradeSummary toSummary(
    Trade trade,
    PartnerSummary? partner,
    StoredImage? offerItemImage,
    StoredImage? wantedItemImage,
    List<int> stages,
  ) {
    final List<TradeStage> completedStages = stages
        .map((s) => TradeStage.fromCode(s))
        .toList();

    return TradeSummary(
      tradeId: trade.tradeId,
      partner: partner,
      tradeType: TradeType.fromCode(trade.tradeTypeId),
      deliveryType: DeliveryType.fromCode(trade.deliveryTypeId),
      offerItem: TradeItem(itemName: trade.offerItem, image: offerItemImage),
      wantedItem: TradeItem(itemName: trade.wantedItem, image: wantedItemImage),
      completedStages: completedStages,
      tradedAt: trade.tradedAt,
      location: trade.location,
      isPrepaid: trade.isPrepaid,
      memo: trade.memo,
    );
  }

  /// 取引詳細モデル変換
  ///
  /// 取引データを取引詳細モデルへ変換します。
  ///
  /// - [trade]　取引データ
  /// - [partner] 取引相手詳細モデル
  /// - [offerItemImage] 譲渡アイテム画像
  /// - [wantedItemImage] 希望アイテム画像
  /// - [stages] 取引ステージ
  static TradeDetail toDetail(
    Trade trade,
    PartnerDetail? partner,
    StoredImage? offerItemImage,
    StoredImage? wantedItemImage,
    List<TradeStageHistory> stages,
  ) {
    final List<TradeStage> completedStages = stages
        .map((s) => s.stageCode)
        .map((s) => TradeStage.fromCode(s))
        .toList();

    return TradeDetail(
      tradeId: trade.tradeId,
      partner: partner,
      tradeType: TradeType.fromCode(trade.tradeTypeId),
      deliveryType: DeliveryType.fromCode(trade.deliveryTypeId),
      offerItem: TradeItem(itemName: trade.offerItem, image: offerItemImage),
      wantedItem: TradeItem(itemName: trade.wantedItem, image: wantedItemImage),
      completedStages: completedStages,
      tradedAt: trade.tradedAt,
      location: trade.location,
      isPrepaid: trade.isPrepaid,
      memo: trade.memo,
    );
  }

  //
  // toForm
  //

  static TradeForm toForm(TradeDetail trade) {
    return TradeForm(
      partner: PartnerForm(
        userId: trade.partner?.userId,
        username: trade.partner?.username,
      ),
      tradeTypeId: trade.tradeType.code,
      deliveryTypeId: trade.deliveryType.code,
      offerItemName: trade.offerItem.itemName,
      wantedItemName: trade.wantedItem.itemName,
      offerItemImage: trade.offerItem.image?.bytes,
      wantedItemImage: trade.wantedItem.image?.bytes,
      tradedAt: trade.tradedAt,
      location: trade.location,
      isPrepaid: trade.isPrepaid,
      memo: trade.memo,
    );
  }

  //
  // toEntity
  //

  static Trade toEntity(
    Trade existing,
    TradeForm form, {
    required String? offerItemImageId,
    required String? wantedItemImageId,
  }) {
    return existing.copyWith(
      tradeTypeId: form.tradeType.value,
      deliveryTypeId: form.deliveryType.value,
      offerItem: form.offerItemName.value,
      wantedItem: form.wantedItemName.value,
      offerItemImageId: Value(offerItemImageId),
      wantedItemImageId: Value(wantedItemImageId),
      tradedAt: Value(form.tradedAt.value),
      location: Value(form.location.value),
      isPrepaid: form.isPrepaid.value,
      memo: Value(form.memo.value),
    );
  }
}
