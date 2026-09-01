class AppCode {
  const AppCode._(); // インスタンス化禁止

  ///
  /// 取引種別
  ///

  /// 1: 交換
  static const tradeTypeExchange = '交換';

  /// 2: 譲渡
  static const tradeTypeTransfer = '譲渡';

  /// 3: 買取
  static const tradeTypePurchase = '買取';

  ///
  /// 受渡種別
  ///

  /// 1: 手渡し
  static const deliveryTypeHandoff = '手渡し';

  /// 2: 郵送
  static const deliveryTypeShipping = '郵送';

  ///
  /// 取引進行ステージ
  ///

  /// 1: 取引成立
  static const tradeStageAgreed = '取引成立';

  /// 2: 商品受取済み
  static const tradeStageOrderedItemReceived = '商品受取済み';

  /// 3: 代金受取済み
  static const tradeStagePaymentReceived = '代金受取済み';

  /// 4: 支払済み
  static const tradeStagePaid = '支払済み';

  /// 5: 発送済み
  static const tradeStageShipped = '発送済み';

  /// 6: 受取済み
  static const tradeStageReceived = '受取済み';

  /// 7: 取引終了
  static const tradeStageCompleted = '取引終了';
}
