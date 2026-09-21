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

  /// 取引相手サービス生成
  ///
  /// `AppDatabase`を使用して取引相手サービスを生成します。
  ///
  /// - [database] データベース
  factory PartnerService.fromDatabase(AppDatabase database) {
    return PartnerService(repository: PartnerRepository(database));
  }

  /// 取引相手サービス生成
  ///
  /// 指定したリポジトリを使用して取引相手サービスを生成します。
  ///
  /// - [repository] 取引相手リポジトリ
  factory PartnerService({required PartnerRepository repository}) {
    return PartnerService._(repository: repository);
  }

  PartnerService._({required this._repository});

  //
  // public method
  //

  /// 取引相手リスト取得
  ///
  /// 取引相手を ID で取得できる Map として返却します。
  ///
  /// - [partnerIds] 取引相手IDリスト
  Future<Map<String, Partner>> getPartnersById(List<String> partnerIds) async {
    final conditions = PartnerSearchConditions(partnerIds: partnerIds);
    final partners = await _repository.getByConditions(conditions);

    return {for (final partner in partners) partner.partnerId: partner};
  }
}
