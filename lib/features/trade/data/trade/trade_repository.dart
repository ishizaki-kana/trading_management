import 'package:drift/drift.dart';
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

    // キーワード（半角スペース・全角スペース・改行区切り）
    if (conditions.keywords case final keywords?
        when keywords.trim().isNotEmpty) {
      final keywordList = keywords.trim().split(RegExp(r'[\s\u3000]+'));

      query.where(
        (trade) => keywordList
            .map((keyword) {
              final pattern = '%$keyword%'; // 部分一致

              return trade.offerItem.like(pattern) |
                  trade.wantedItem.like(pattern);
            })
            .reduce((cond1, cond2) => cond1 | cond2),
      );
    }

    // 取引種別
    if (conditions.tradeType case final tradeType?) {
      query.where((trade) => trade.tradeTypeId.equals(tradeType.code));
    }

    // 引渡種別
    if (conditions.deliveryType case final deliveryType?) {
      query.where((trade) => trade.deliveryTypeId.equals(deliveryType.code));
    }

    return query.get();
  }
}
