import 'package:drift/drift.dart';

/// 取引相手テーブル
@DataClassName('Partner')
class Partners extends Table {
  //
  // fields
  //

  /// 取引相手ID
  TextColumn get partnerId => text()();

  /// ユーザーID
  TextColumn get userId => text()();

  /// ユーザー名
  TextColumn get username => text()();

  //
  // getter
  //

  @override
  Set<Column<Object>> get primaryKey => {partnerId, userId, username};
}
