import 'package:trading_management/core/data/database/app_database.dart';

/// 取引アイテム
class TradeItem {
  //
  // fields
  //

  /// アイテム名
  final String? itemName;

  /// 画像
  final StoredImage? image;

  //
  // constructor
  //

  const TradeItem({this.itemName, this.image});
}
