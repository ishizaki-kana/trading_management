import 'package:drift/drift.dart';
import 'package:trading_management/core/data/tables/trades.dart';

/// 取引ステージ履歴テーブル
@DataClassName('TradeStageHistory')
class TradeStageHistories extends Table {
  //
  // fields
  //

  /// 取引ID
  TextColumn get tradeId =>
      text().references(Trades, #tradeId, onDelete: KeyAction.cascade)();

  /// 取引ステージコード
  IntColumn get stageCode => integer()();

  /// 作成日時
  DateTimeColumn get createdAt => dateTime()();

  //
  // getter
  //

  @override
  Set<Column<Object>> get primaryKey => {tradeId, stageCode};
}
