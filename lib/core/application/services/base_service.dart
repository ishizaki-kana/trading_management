import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/exception/database_exception.dart';
import 'package:trading_management/core/exception/not_found_exception.dart';
import 'package:trading_management/core/exception/validation_exception.dart';

/// ベースサービスクラス
abstract class BaseService {
  //
  // fields
  //

  /// データベース
  final AppDatabase database;

  //
  // constructor
  //

  const BaseService(this.database);

  //
  // getter
  //

  /// ID名
  String get idName;

  //
  // public methods
  //

  /// 処理実行
  ///
  /// - [action] 実行する処理
  ///
  /// 例外:
  /// - [NotFoundException] データが存在しないとき
  /// - [ValidationException] バリデーションエラーが発生したとき
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<T> execute<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on NotFoundException catch (e) {
      debugPrint(e.message);
      rethrow;
    } on ValidationException catch (e) {
      debugPrint(e.message);
      rethrow;
    } on DriftWrappedException catch (e, s) {
      debugPrint(e.message);
      Error.throwWithStackTrace(DatabaseException(e), s);
    }
  }

  /// トランザクション実行
  ///
  /// - [action] トランザクション内で実行する処理
  ///
  /// 例外:
  /// - [NotFoundException] データが存在しないとき
  /// - [ValidationException] バリデーションエラーが発生したとき
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<T> inTransaction<T>(Future<T> Function() action) {
    return execute(() => database.transaction(action));
  }
}
