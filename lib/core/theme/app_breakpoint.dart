/// ブレイクポイント定義
///
/// レスポンシブレイアウトで使用するブレイクポイントを定義するクラスです。
/// 各定義はそれぞれのレイアウトが適用される最小幅を表します。
class AppBreakpoint {
  AppBreakpoint._(); // インスタンス化禁止

  /// モバイルの最小幅 `0px`
  static const double mobile = 0;

  /// タブレットの最小幅 `690px`
  static const double tablet = 690;

  /// スモールデスクトップの最小幅 `840px`
  static const double small = 840;

  /// デスクトップの最小幅 `1280px`
  static const double desktop = 1280;

  /// モバイル判定
  ///
  /// - 対象: 0px ~ 689px
  static bool isMobile(double width) => width < tablet;

  /// タブレット判定
  ///
  /// - 対象: 690px ~ 839px
  static bool isTablet(double width) => width >= tablet && width < small;

  /// スモールデスクトップ判定
  ///
  /// - 対象: 840px ~ 1279px
  static bool isSmallDesktop(double width) => width >= small && width < desktop;

  /// デスクトップ判定
  ///
  /// - 対象: 1280px ~
  static bool isDesktop(double width) => width >= desktop;
}
