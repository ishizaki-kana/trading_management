import 'package:trading_management/features/trade/domain/entities/delivery_type.dart';
import 'package:trading_management/features/trade/domain/entities/trade_stage.dart';
import 'package:trading_management/features/trade/domain/entities/trade_type.dart';

/// 取引ステージ判定クラス
class TradeStageResolver {
  const TradeStageResolver();

  /// 取引ステージ判定
  ///
  /// 取引種別と引渡種別から取引ステージの一覧を取得します。
  ///
  /// - [tradeType] 取引種別
  /// - [deliveryType] 引渡種別
  /// - [isPrepaid] 先払いかどうか
  List<TradeStage> resolve({
    required TradeType tradeType,
    required DeliveryType deliveryType,
    required bool isPrepaid,
  }) {
    if (deliveryType == DeliveryType.handoff) {
      return const [TradeStage.agreed, TradeStage.completed];
    }

    return switch (tradeType) {
      // 交換
      TradeType.exchange => const [
        TradeStage.agreed,
        TradeStage.shipped,
        TradeStage.received,
        TradeStage.completed,
      ],
      // 譲渡
      TradeType.transfer =>
        isPrepaid
            ? const [
                TradeStage.agreed,
                TradeStage.paymentReceived,
                TradeStage.shipped,
                TradeStage.completed,
              ]
            : const [
                TradeStage.agreed,
                TradeStage.shipped,
                TradeStage.paymentReceived,
                TradeStage.completed,
              ],
      // 買取
      TradeType.purchase =>
        isPrepaid
            ? const [
                TradeStage.agreed,
                TradeStage.paid,
                TradeStage.received,
                TradeStage.completed,
              ]
            : const [
                TradeStage.agreed,
                TradeStage.received,
                TradeStage.paid,
                TradeStage.completed,
              ],
    };
  }
}
