import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/rendering.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/exception/database_exception.dart';
import 'package:trading_management/core/exception/not_found_exception.dart';
import 'package:trading_management/core/exception/validation_exception.dart';
import 'package:trading_management/core/types/app_operation_type.dart';

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

  /// テーブル名
  String get tableName;

  //
  // public methods
  //

  /// 処理実行
  ///
  /// - [operation] 実行する処理
  /// - [target] 処理対象
  /// - [action] 実行する処理
  ///
  /// 例外:
  /// - [NotFoundException] データが存在しないとき
  /// - [ValidationException] バリデーションエラーが発生したとき
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<T> execute<T>(
    Future<T> Function() action, {
    required AppOperationType operation,
    Object? target,
  }) async {
    try {
      return await action();
    } on DriftWrappedException catch (e, s) {
      await _throwDatabaseException(e, s, operation, target: target);
    } on DriftRemoteException catch (e, s) {
      await _throwDatabaseException(e, s, operation, target: target);
    } catch (e, s) {
      debugPrint(e.toString());
      await FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
      Error.throwWithStackTrace(e, s);
    }
  }

  /// トランザクション実行
  ///
  /// - [operation] 実行する処理
  /// - [target] 処理対象
  /// - [action] トランザクション内で実行する処理
  ///
  /// 例外:
  /// - [NotFoundException] データが存在しないとき
  /// - [ValidationException] バリデーションエラーが発生したとき
  /// - [DatabaseException] DB処理実行時にエラーが発生したとき
  Future<T> inTransaction<T>(
    AppOperationType operation,
    Object target,
    Future<T> Function() action,
  ) {
    return execute(
      () => database.transaction(action),
      operation: operation,
      target: target,
    );
  }

  //
  // private methods
  //

  Future<Never> _throwDatabaseException(
    Exception e,
    StackTrace s,
    AppOperationType operation, {
    Object? target,
  }) async {
    final ex = DatabaseException(e, operation.failedMessage);

    // firebase
    final crashlytics = FirebaseCrashlytics.instance;
    await crashlytics.setCustomKey('operation', operation.name); // 処理名
    await crashlytics.setCustomKey('type', tableName); // テーブル名
    if (target != null) {
      await crashlytics.setCustomKey('target', target); // 処理対象
    }

    await crashlytics.log('Database error: trade.getById, target=$target');
    await FirebaseCrashlytics.instance.recordError(ex, s, fatal: true);

    Error.throwWithStackTrace(ex, s);
  }
}
