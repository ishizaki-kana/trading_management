import 'package:trading_management/features/trade/domain/models/delivery_type.dart';

/// 取引表示条件
///
/// 取引データの詳細を表示するかどうかを判定する処理を提供します。
class TradeDisplayConditions {
  const TradeDisplayConditions._(); // インスタンス化禁止

  //
  // public methods
  //

  /// 取引相手を表示するか
  ///
  /// 取引相手IDが`null`でないこと
  ///
  /// - [partnerUserId] 取引相手ユーザーID
  static bool shouldDisplayPartner({required String? partnerUserId}) {
    return partnerUserId != null;
  }

  /// 取引日時・場所を表示するか
  ///
  /// 受渡種別が「手渡し」かつ、取引日時・取引場所のいずれかが入力されていること
  ///
  /// - [deliveryType] 受渡種別
  /// - [tradedAt] 取引日時
  /// - [location] 取引場所
  static bool shouldDisplayLocation({
    required DeliveryType deliveryType,
    required DateTime? tradedAt,
    required String? location,
  }) {
    return deliveryType == DeliveryType.handoff &&
        (tradedAt != null || (location?.trim().isNotEmpty ?? false));
  }

  /// メモを表示するか
  ///
  /// メモが入力されていること
  ///
  /// - [memo] メモ
  static bool shouldDisplayMemo({required String? memo}) {
    return memo != null && memo.isNotEmpty;
  }
}
