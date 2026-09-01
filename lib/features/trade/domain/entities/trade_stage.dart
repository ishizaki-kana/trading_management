import 'package:trading_management/core/constants/app_code.dart';

/// 取引ステージ
enum TradeStage {
  /// 取引成立
  agreed(1, AppCode.tradeStageAgreed),

  /// 商品受取済み
  orderedItemReceived(2, AppCode.tradeStageOrderedItemReceived),

  /// 代金受取済み
  paymentReceived(3, AppCode.tradeStagePaymentReceived),

  /// 支払済み
  paid(4, AppCode.tradeStagePaid),

  /// 発送済み
  shipped(5, AppCode.tradeStageShipped),

  /// 受取済み
  received(6, AppCode.tradeStageReceived),

  /// 取引終了
  completed(7, AppCode.tradeStageCompleted);

  const TradeStage(this.code, this.label);

  /// 取引進行ステージコード
  final int code;

  /// ステージ名
  final String label;

  static TradeStage fromCode(int code) {
    return values.firstWhere((s) => s.code == code);
  }
}
