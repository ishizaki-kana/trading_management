import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_repository.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_search_conditions.dart';

/// 取引ステージ履歴サービス
class TradeStageHistoryService {
  //
  // fields
  //

  /// 取引ステージ履歴リポジトリ
  final TradeStageHistoryRepository _repository;

  //
  // constructor
  //

  /// 取引ステージ履歴サービス生成
  ///
  /// `AppDatabase`を使用して取引ステージ履歴サービスを生成します。
  ///
  /// - [database] データベース
  factory TradeStageHistoryService.fromDatabase(AppDatabase database) {
    return TradeStageHistoryService(
      repository: TradeStageHistoryRepository(database),
    );
  }

  /// 取引ステージ履歴サービス生成
  ///
  /// 指定したリポジトリを使用して取引ステージ履歴サービスを生成します。
  ///
  /// - [repository] 取引ステージ履歴リポジトリ
  factory TradeStageHistoryService({
    required TradeStageHistoryRepository repository,
  }) {
    return TradeStageHistoryService._(repository: repository);
  }

  TradeStageHistoryService._({required this._repository});

  //
  // public method
  //

  /// 取引ステージ履歴リスト取得
  ///
  /// 取引ステージ履歴を取引IDで取得できる Map として返却します。
  ///
  /// - [tradeIds] 取引IDリスト
  Future<Map<String, List<int>>> getHistories(List<String> tradeIds) async {
    final conditions = TradeStageHistorySearchConditions(tradeIds: tradeIds);
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
