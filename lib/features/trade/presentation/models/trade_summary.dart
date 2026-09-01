import 'package:trading_management/features/trade/domain/entities/delivery_type.dart';
import 'package:trading_management/features/trade/domain/entities/trade_stage.dart';
import 'package:trading_management/features/trade/domain/entities/trade_type.dart';

/// 取引概要ビューモデル
class TradeSummary {
  /// 取引ID
  final String tradeId;

  /// 取引相手の表示名（例：ユーザー名（@ユーザーID）さん）
  final String partnerText;

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

  /// 先払いかどうか
  final bool isPrepaid;

  /// メモ
  final String? memo;

  const TradeSummary({
    required this.tradeId,
    required this.partnerText,
    required this.tradeType,
    required this.deliveryType,
    required this.offerItem,
    required this.wantedItem,
    required this.completedStages,
    required this.isPrepaid,
    required this.memo,
  });
}

class TradeItem {
  /// アイテム名
  final String? itemName;

  /// アイテム画像のURL
  final String? imageUrl;

  const TradeItem({this.itemName, this.imageUrl});
}
