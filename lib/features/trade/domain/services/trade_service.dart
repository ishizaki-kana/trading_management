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
  final TradeRepository _repository;

  final PartnerService partnerService;
  final TradeStageHistoryService stageHistoryService;

  const TradeService(
    this._repository,
    this.partnerService,
    this.stageHistoryService,
  );

  /// 取引リスト取得
  Future<List<TradeSummary>> getTrades() async {
    final conditions = TradeSearchConditions();
    final trades = await _repository.getByConditions(conditions);
    final partners = await partnerService.getPartnersById();

    final stages = await stageHistoryService.getHistories();
    //  final stageHistoryIds

    return trades.map((trade) {
      final partner = partners[trade.partnerId];
      final compStage = stages[trade.tradeId];
      return TradeMapper.toTradeSummary(trade, partner, compStage ?? []);
    }).toList();
  }
}
