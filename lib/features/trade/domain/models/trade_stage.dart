/// 取引ステージ
enum TradeStage {
  //
  // enum
  //

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

  //
  // fields
  //

  /// 取引進行ステージコード
  final int code;

  /// ステージ名
  final String label;

  //
  // constructor
  //

  const TradeStage(this.code, this.label);

  //
  // public methods
  //

  /// 取引ステージ取得
  ///
  /// コードに対応する取引ステージを返します。
  ///
  /// - [code] 取引ステージコード
  static TradeStage fromCode(int code) {
    return values.firstWhere((s) => s.code == code);
  }
}
