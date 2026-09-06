import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/repositories/base_repository.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';

/// 取引リポジトリ
class TradeRepository
    extends BaseRepository<Trade, String, TradeSearchConditions> {
  //
  // constructor
  //
  const TradeRepository(super.database);

  //
  // public method
  //

  @override
  Future<Trade?> getById(String id) {
    final query = database.select(database.trades)
      ..where((trade) => trade.tradeId.equals(id));

    return query.getSingleOrNull();
  }

  @override
  Future<List<Trade>> getByConditions(TradeSearchConditions conditions) {
    final query = database.select(database.trades);

    if (conditions.tradeType case final tradeType?) {
      query.where((trade) => trade.tradeTypeId.equals(tradeType.code));
    }
    if (conditions.deliveryType case final deliveryType?) {
      query.where((trade) => trade.deliveryTypeId.equals(deliveryType.code));
    }

    return query.get();
  }
}
