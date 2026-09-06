import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/repositories/base_search_conditions.dart';

/// ベースリポジトリクラス
///
/// すべてのテーブルで使用できる汎用的なCRUD操作を定義します。
abstract class BaseRepository<
  T,
  Id extends Object,
  C extends BaseSearchConditions
> {
  //
  // fields
  //

  /// データベース
  final AppDatabase database;

  //
  // constructor
  //
  const BaseRepository(this.database);

  //
  // public method
  //

  /// エンティティ取得
  ///
  /// IDが一致するエンティティを取得します。
  ///
  /// 対象が存在しない場合は `null` を返却します。
  ///
  /// - [id] ID
  Future<T?> getById(Id id) {
    throw UnimplementedError('getById is not implemented');
  }

  /// エンティティリスト取得
  ///
  /// 条件に一致するエンティティをすべて取得します。
  ///
  /// `C` のフィールドがすべて未指定の場合、すべてのエンティティを返却します。
  ///
  /// - [conditions] 条件
  Future<List<T>> getByConditions(C conditions) {
    throw UnimplementedError('getByConditions is not implemented');
  }

  /// エンティティ作成
  ///
  /// - [entity] 作成するエンティティ
  Future<void> insert(T entity) {
    throw UnimplementedError('insert is not implemented');
  }

  /// エンティティ更新
  ///
  /// - [entity] 更新するエンティティ
  Future<void> update(T entity) {
    throw UnimplementedError('update is not implemented');
  }

  /// エンティティ削除
  ///
  /// - [id] 削除するエンティティのID
  Future<void> delete(Id id) {
    throw UnimplementedError('delete is not implemented');
  }
}
