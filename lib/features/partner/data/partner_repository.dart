import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/repositories/base_repository.dart';
import 'package:trading_management/features/partner/data/partner_search_conditions.dart';

/// 取引相手リポジトリ
class PartnerRepository
    extends BaseRepository<Partner, String, PartnerSearchConditions> {
  //
  // constructor
  //
  const PartnerRepository(super.database);

  //
  // public method
  //

  @override
  Future<List<Partner>> getByConditions(PartnerSearchConditions conditions) {
    final query = database.select(database.partners);

    return query.get();
  }
}
