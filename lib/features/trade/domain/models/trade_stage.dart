/// 取引ステージ
enum TradeStage {
  /// 取引成立
  agreed(1, '取引成立'),

  /// 商品受取済み
  orderedItemReceived(2, '商品受け取り済み'),

  /// 代金受取済み
  paymentReceived(3, '代金受取済み'),

  /// 支払済み
  paid(4, '支払済み'),

  /// 発送済み
  shipped(5, '発送済み'),

  /// 受取済み
  received(6, '受取済み'),

  /// 取引終了
  completed(7, '取引終了');

  const TradeStage(this.code, this.label);

  /// 取引進行ステージコード
  final int code;

  /// ステージ名
  final String label;

  static TradeStage fromCode(int code) {
    return values.firstWhere((s) => s.code == code);
  }
}
