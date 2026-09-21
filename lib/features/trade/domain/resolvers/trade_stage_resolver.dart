import 'package:trading_management/features/trade/application/models/trade_summary.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引ステージ判定クラス
class TradeStageResolver {
  const TradeStageResolver._(); // インスタンス化禁止

  //
  // public methods
  //

  /// 取引ステージ判定
  ///
  /// 取引種別と引渡種別から取引ステージの一覧を取得します。
  ///
  /// - [trade] 取引データ
  static List<TradeStage> resolve({required TradeSummary trade}) {
    final tradeType = trade.tradeType;
    final deliveryType = trade.deliveryType;
    final isPrepaid = trade.isPrepaid;

    //　手渡し
    if (deliveryType == DeliveryType.handoff) {
      return const [TradeStage.agreed, TradeStage.completed];
    }

    // 郵送
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
