import 'package:trading_management/core/presentation/error/app_message.dart';

/// 処理種別
enum AppOperationType {
  //
  // enum
  //

  /// 単体のデータの取得
  getById(AppMessage.dataLoadFailed),

  /// 複数のデータの取得
  getByIds(AppMessage.dataLoadFailed),

  /// 条件が一致する複数のデータの取得
  getByConditions(AppMessage.dataLoadFailed),

  /// 登録
  insert(AppMessage.dataInsertFailed),

  /// 更新
  update(AppMessage.dataUpdateFailed),

  /// 削除
  delete(AppMessage.dataDeleteFailed);

  //
  // fields
  //

  /// 失敗時のメッセージ
  final String failedMessage;

  //
  // constructor
  //

  const AppOperationType(this.failedMessage);
}
