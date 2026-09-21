import 'package:trading_management/core/data/repositories/base_search_conditions.dart';

/// 取引相手検索条件
class PartnerSearchConditions extends BaseSearchConditions {
  //
  // fields
  //

  /// 取引相手ID
  final List<String>? partnerIds;

  //
  // constructor
  //

  const PartnerSearchConditions({this.partnerIds});
}
