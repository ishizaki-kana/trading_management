import 'package:trading_management/core/data/repositories/base_search_conditions.dart';

/// 取引ステージ履歴検索条件
class TradeStageHistorySearchConditions extends BaseSearchConditions {
  //
  // fields
  //

  /// 取引ID
  final String? tradeId;

  /// 取引IDリスト
  final List<String>? tradeIds;

  //
  // constructor
  //

  const TradeStageHistorySearchConditions({this.tradeId, this.tradeIds});
}
