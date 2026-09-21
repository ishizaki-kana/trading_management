import 'package:drift/drift.dart';

/// 画像テーブル
@DataClassName('StoredImage')
class StoredImages extends Table {
  //
  // fields
  //

  /// 画像ID
  TextColumn get imageId => text()();

  /// 画像データ
  BlobColumn get bytes => blob()();

  /// MIMEタイプ
  TextColumn get mimeType => text()();

  /// 作成日時
  DateTimeColumn get createdAt => dateTime()();

  //
  // getter
  //

  @override
  Set<Column<Object>> get primaryKey => {imageId};
}
