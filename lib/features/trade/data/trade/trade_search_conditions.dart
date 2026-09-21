import 'package:trading_management/core/data/repositories/base_search_conditions.dart';
import 'package:trading_management/features/trade/domain/models/delivery_type.dart';
import 'package:trading_management/features/trade/domain/models/trade_type.dart';

/// 取引検索条件
class TradeSearchConditions extends BaseSearchConditions {
  //
  // fields
  //

  /// キーワード
  final String? keywords;

  /// 取引種別
  final TradeType? tradeType;

  /// 受渡種別
  final DeliveryType? deliveryType;

  //
  // constructor
  //

  const TradeSearchConditions({
    this.keywords,
    this.tradeType,
    this.deliveryType,
  });
}
