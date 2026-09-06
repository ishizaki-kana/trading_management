import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_repository.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_search_conditions.dart';

/// 取引ステージ履歴サービス
class TradeStageHistoryService {
  //
  // fields
  //
  final TradeStageHistoryRepository _repository;

  //
  // constructor
  //
  const TradeStageHistoryService(this._repository);

  //
  // public method
  //

  /// 取引ステージ履歴リスト取得
  ///
  /// 取引ステージ履歴を取引IDで取得できる Map として返却します。
  Future<Map<String, List<int>>> getHistories() async {
    final conditions = TradeStageHistorySearchConditions();
    final histories = await _repository.getByConditions(conditions);
    final historyById = <String, List<int>>{};

    for (final history in histories) {
      final historiesOfTrade = historyById.putIfAbsent(
        history.tradeId,
        () => [],
      );

      historiesOfTrade.add(history.stageCode);
    }

    return historyById;
  }
}
