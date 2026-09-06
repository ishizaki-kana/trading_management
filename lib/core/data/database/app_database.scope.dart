import 'package:flutter/material.dart';
import 'package:trading_management/core/data/database/app_database.dart';

/// データベースコンテキスト
///
/// `AppDatabaseScope.of` を通じてアプリ全体で
/// 同じデータベースインスタンスを取得できます。
class AppDatabaseScope extends InheritedWidget {
  /// データベース
  final AppDatabase database;

  const AppDatabaseScope({
    required this.database,
    required super.child,
    super.key,
  });

  /// データベース取得
  static AppDatabase of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AppDatabaseScope>();
    assert(scope != null, 'AppDatabaseScope が見つかりません。');
    return scope!.database;
  }

  /// 子要素再ビルド判定
  ///
  /// 起動中にDBインスタンスを差し替える場合は `true`
  @override
  bool updateShouldNotify(AppDatabaseScope oldWidget) {
    return oldWidget.database != database;
  }
}
