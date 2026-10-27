import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/features/partner/application/forms/partner_form.dart';
import 'package:trading_management/features/partner/application/models/partner_detail.dart';
import 'package:trading_management/features/partner/application/models/partner_summary.dart';

/// 取引相手データ変換クラス
class PartnerMapper {
  PartnerMapper._(); // インスタンス化禁止

  //
  // toDto
  //

  /// 概要モデル変換
  ///
  /// エンティティを概要モデルへ変換します。
  ///
  /// - [partner] エンティティ
  static PartnerSummary toPartnerSummary(Partner partner) {
    return PartnerSummary(userId: partner.userId, username: partner.username);
  }

  /// 詳細モデル変換
  ///
  /// エンティティを詳細モデルへ変換します。
  ///
  /// - [partner] エンティティ
  static PartnerDetail toPartnerDetail(Partner partner) {
    return PartnerDetail(
      partnerId: partner.partnerId,
      userId: partner.userId,
      username: partner.username,
    );
  }

  //
  // toEntity
  //

  /// エンティティ変換
  ///
  /// フォームをエンティティへ変換します。
  /// このメソッドを使用する前に、バリデーションを行ってnullで
  ///
  /// - [partnerId] 取引相手ID
  /// - [form] フォーム
  static Partner toNewPartner(String partnerId, PartnerForm form) {
    return Partner(
      partnerId: partnerId,
      userId: form.userId.value,
      username: form.username.value,
    );
  }

  /// エンティティ変換
  ///
  /// フォームをエンティティへ変換します。
  /// フォーム内で入力されていない値は既存の登録値を保持します。
  ///
  /// - [existing] 既存のエンティティ
  /// - [form] フォーム
  static Partner toUpdatedPartner(Partner existing, PartnerForm form) {
    return existing.copyWith(
      userId: form.userId.value,
      username: form.username.value,
    );
  }
}
