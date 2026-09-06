import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/partner/data/partner_repository.dart';
import 'package:trading_management/features/partner/data/partner_search_conditions.dart';

/// 取引相手サービス
class PartnerService {
  //
  // fields
  //

  /// 取引相手リポジトリ
  final PartnerRepository _repository;

  //
  // constructor
  //
  const PartnerService(this._repository);

  //
  // public method
  //

  /// 取引相手リスト取得
  ///
  /// 取引相手を ID で取得できる Map として返却します。
  Future<Map<String, Partner>> getPartnersById() async {
    final conditions = PartnerSearchConditions();
    final partners = await _repository.getByConditions(conditions);
    final map = {for (final partner in partners) partner.partnerId: partner};

    return map;
  }
}
