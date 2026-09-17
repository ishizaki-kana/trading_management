import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/partner/domain/services/partner_service.dart';
import 'package:trading_management/features/trade/data/trade/trade_repository.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';
import 'package:trading_management/features/trade/domain/services/trade_stage_history_service.dart';
import 'package:trading_management/features/trade/presentation/mappers/trade_mapper.dart';
import 'package:trading_management/features/trade/presentation/view_models/trade_summary.dart';

/// 取引サービス
///
/// 取引データの取得・登録・更新・削除を行います。
class TradeService {
  //
  // fields
  //

  /// 取引リポジトリ
  final TradeRepository _repository;

  /// 取引相手サービス
  final PartnerService _partnerService;

  /// 取引ステージ履歴サービス
  final TradeStageHistoryService _stageHistoryService;

  TradeService(AppDatabase database)
    : _repository = TradeRepository(database),
      _partnerService = PartnerService(database),
      _stageHistoryService = TradeStageHistoryService(database);

  /// 取引リスト取得
  Future<List<TradeSummary>> getTrades(TradeSearchConditions conditions) async {
    final trades = await _repository.getByConditions(conditions);
    final partners = await _partnerService.getPartnersById();

    final stages = await _stageHistoryService.getHistories();
    //  final stageHistoryIds

    return trades.map((trade) {
      final partner = partners[trade.partnerId];
      final compStage = stages[trade.tradeId];
      return TradeMapper.toTradeSummary(trade, partner, compStage ?? []);
    }).toList();
  }
}
