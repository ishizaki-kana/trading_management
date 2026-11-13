import 'package:trading_management/core/application/services/base_service.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/types/app_operation_type.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_repository.dart';
import 'package:trading_management/features/trade/data/trade_stage_history/trade_stage_history_search_conditions.dart';
import 'package:trading_management/features/trade/domain/models/trade_stage.dart';

/// 取引ステージ履歴サービス
class TradeStageHistoryService extends BaseService {
  //
  // fields
  //

  /// 取引ステージ履歴リポジトリ
  final TradeStageHistoryRepository _repository;

  //
  // getter
  //

  @override
  String get tableName => 'tradeStageHistories';

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

  TradeStageHistoryService._({required TradeStageHistoryRepository repository})
    : _repository = repository,
      super(repository.database);

  //
  // public method
  //

  /// 取引ステージ履歴取得
  ///
  /// - [tradeId] 取引ID
  Future<List<TradeStageHistory>> getById(String tradeId) {
    return execute(
      () async {
        final conditions = TradeStageHistorySearchConditions(tradeId: tradeId);
        return await _repository.getByConditions(conditions);
      },
      operation: AppOperationType.getById,
      target: tradeId,
    );
  }

  /// 取引ステージ履歴リスト取得
  ///
  /// 取引ステージ履歴を取引IDで取得できる Map として返却します。
  ///
  /// - [tradeIds] 取引IDリスト
  Future<Map<String, List<int>>> getByIds(List<String> tradeIds) {
    return execute(() async {
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
    }, operation: AppOperationType.getByIds);
  }

  Future<void> insert({required String tradeId, required TradeStage stage}) {
    return execute(
      () async {
        final history = TradeStageHistory(
          tradeId: tradeId,
          stageCode: stage.code,
          createdAt: DateTime.now(),
        );
        await _repository.insert(history);
      },
      operation: AppOperationType.insert,
      target: ({tradeId: tradeId, stage: stage}),
    );
  }
}
