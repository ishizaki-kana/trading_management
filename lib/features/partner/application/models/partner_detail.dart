/// 取引相手詳細
class PartnerDetail {
  //
  // fields
  //

  /// 取引相手ID
  final String partnerId;

  /// ユーザーID
  final String userId;

  /// ユーザー名
  final String username;

  //
  // constructor
  //

  const PartnerDetail({
    required this.partnerId,
    required this.userId,
    required this.username,
  });
}
