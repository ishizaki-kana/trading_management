/// アニメーション時間定義
///
/// アプリで使用するアニメーション時間を定義するクラスです。
class AppDuration {
  AppDuration._();

  /// `100ms`
  static const short = Duration(milliseconds: 100);

  /// `200ms`
  static const normal = Duration(milliseconds: 200);

  /// `300ms`
  static const slow = Duration(milliseconds: 300);

  /// `500ms`
  static const verySlow = Duration(milliseconds: 500);

  /// `2500ms`
  static const notification = Duration(milliseconds: 2500);
}
