import 'package:trading_management/core/application/services/base_service.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/exception/not_found_exception.dart';
import 'package:trading_management/core/utils/id_generator.dart';
import 'package:trading_management/features/partner/application/forms/partner_form.dart';
import 'package:trading_management/features/partner/application/forms/partner_validator.dart';
import 'package:trading_management/features/partner/application/mapper/partner_mapper.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/partner/application/models/partner_summary.dart';
import 'package:trading_management/features/partner/data/partner_repository.dart';
import 'package:trading_management/features/partner/data/partner_search_conditions.dart';

/// 取引相手サービス
class PartnerService extends BaseService {
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
    return PartnerService._(PartnerRepository(database));
  }

  /// 取引相手サービス生成（テスト用）
  ///
  /// 指定したリポジトリを使用して取引相手サービスを生成します。
  ///
  /// - [repository] 取引相手リポジトリ
  factory PartnerService({required PartnerRepository repository}) {
    return PartnerService._(repository);
  }

  /// プライベートコンストラクタ
  PartnerService._(PartnerRepository repository)
    : _repository = repository,
      super(repository.database);

  //
  // getter
  //

  @override
  String get idName => '取引相手ID';

  //
  // public method
  //

  /// 取引相手詳細取得
  ///
  /// 取引相手IDに対応する取引相手詳細を取得します。
  ///
  /// - [partnerId] 取引相手ID
  ///
  /// 例外:
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<PartnerDetail?> getById(String partnerId) {
    return execute(() async {
      final partner = await _repository.getById(partnerId);

      if (partner == null) return null;
      return PartnerMapper.toPartnerDetail(partner);
    });
  }

  /// 取引相手概要リスト取得
  ///
  /// 取引相手概要を ID で取得できる Map として返却します。
  ///
  /// - [partnerIds] 取引相手IDリスト
  ///
  /// 例外:
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<Map<String, PartnerSummary>> getByIds(List<String> partnerIds) {
    return execute(() async {
      final conditions = PartnerSearchConditions(partnerIds: partnerIds);
      final partners = await _repository.getByConditions(conditions);

      return {
        for (final partner in partners)
          partner.partnerId: PartnerMapper.toPartnerSummary(partner),
      };
    });
  }

  /// 取引相手データ新規登録・更新
  ///
  /// 取引相手IDに対応するデータが存在するときは更新、
  /// 存在しないときは、データを新規作成します。
  ///
  /// - [partnerId] 取引相手ID
  /// - [form] 取引相手フォーム
  ///
  /// 例外:
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<void> upsert(String? partnerId, PartnerForm form) {
    return execute(() async {
      // バリデーション
      PartnerValidator.validate(form);

      // データ存在チェック
      Partner? existing;
      if (partnerId != null) existing = await _repository.getById(partnerId);

      if (existing == null) {
        await _insert(form); // 新規作成
      } else {
        await _update(existing, form); // 更新
      }
    });
  }

  /// 取引相手削除
  ///
  /// - [partnerId] 取引相手ID
  ///
  /// 例外:
  /// - [NotFoundException] データが存在しないとき
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<void> delete(String partnerId) {
    return execute(() async {
      final result = await _repository.delete(partnerId);

      if (!result) {
        throw NotFoundException(idName, partnerId);
      }
    });
  }

  //
  // private methods
  //

  /// 取引相手新規作成
  ///
  /// - [form] 取引相手フォーム
  ///
  /// 例外:
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<void> _insert(PartnerForm form) {
    return execute(() async {
      final partnerId = IdGenerator.newId();
      final entity = PartnerMapper.toNewPartner(partnerId, form);
      await _repository.insert(entity);
    });
  }

  /// 取引相手更新
  ///
  /// - [existing] 既存エンティティ
  /// - [form] 取引相手フォーム
  ///
  /// 例外:
  /// - [NotFoundException] データが存在しないとき
  /// - [DatabaseException] DB実行時にエラーが発生したとき
  Future<void> _update(Partner existing, PartnerForm form) {
    return execute(() async {
      final entity = PartnerMapper.toUpdatedPartner(existing, form);
      final result = await _repository.update(entity);

      if (!result) {
        throw NotFoundException(idName, existing.partnerId);
      }
    });
  }
}
