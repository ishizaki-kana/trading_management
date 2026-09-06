import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/repositories/base_repository.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_search_conditions.dart';

/// 取引ステージ履歴リポジトリ
class TradeStageHistoryRepository
    extends
        BaseRepository<
          TradeStageHistory,
          ({String tradeId, int stageCode}),
          TradeStageHistorySearchConditions
        > {
  //
  // constructor
  //
  const TradeStageHistoryRepository(super.database);

  //
  // public method
  //

  @override
  Future<List<TradeStageHistory>> getByConditions(
    TradeStageHistorySearchConditions conditions,
  ) {
    final query = database.select(database.tradeStageHistories);

    if (conditions.tradeId case final tradeId?) {
      query.where((history) => history.tradeId.equals(tradeId));
    }

    return query.get();
  }
}
