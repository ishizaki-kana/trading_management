import 'package:trading_management/features/trade/application/models/trade_item.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引概要ビューモデル
class TradeSummary {
  //
  // fields
  //

  /// 取引ID
  final String tradeId;

  /// 取引相手のユーザーID
  final String? partnerUserId;

  /// 取引相手のユーザー名
  final String? partnerUsername;

  /// 取引種別
  final TradeType tradeType;

  /// 受渡種別
  final DeliveryType deliveryType;

  /// 取引で譲渡するアイテム
  final TradeItem offerItem;

  /// 取引で求めるアイテム
  final TradeItem wantedItem;

  /// 取引ステージ完了済みリスト
  final List<TradeStage> completedStages;

  /// 交換日時
  final DateTime? exchangeDateTime;

  /// 先払いかどうか
  final bool isPrepaid;

  /// メモ
  final String? memo;

  //
  // constructor
  //

  const TradeSummary({
    required this.tradeId,
    required this.partnerUserId,
    required this.partnerUsername,
    required this.tradeType,
    required this.deliveryType,
    required this.offerItem,
    required this.wantedItem,
    required this.completedStages,
    required this.exchangeDateTime,
    required this.isPrepaid,
    required this.memo,
  });
}
