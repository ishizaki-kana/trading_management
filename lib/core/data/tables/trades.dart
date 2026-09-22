import 'package:drift/drift.dart';

/// 取引テーブル
@DataClassName('Trade')
class Trades extends Table {
  //
  // fields
  //

  /// 取引ID
  TextColumn get tradeId => text()();

  /// 取引種別ID
  IntColumn get tradeTypeId => integer()();

  /// 受渡種別ID
  IntColumn get deliveryTypeId => integer()();

  /// 取引相手ID
  TextColumn get partnerId => text()();

  /// 譲渡するアイテム名
  TextColumn get offerItem => text()();

  /// 受け取りたいアイテム名
  TextColumn get wantedItem => text()();

  /// 譲渡するアイテムの画像ID
  TextColumn get offerItemImageId => text().nullable()();

  /// 受け取りたいアイテムの画像ID
  TextColumn get wantedItemImageId => text().nullable()();

  /// 取引日時
  DateTimeColumn get tradedAt => dateTime().nullable()();

  /// 取引場所
  TextColumn get location => text().nullable()();

  /// 先払いかどうか
  BoolColumn get isPrepaid => boolean()();

  /// メモ
  TextColumn get memo => text().nullable()();

  //
  // getter
  //

  @override
  Set<Column<Object>> get primaryKey => {tradeId};
}
