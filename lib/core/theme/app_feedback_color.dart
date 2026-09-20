import 'package:flutter/material.dart';

/// 状態種別ごとの表示色を定義するテーマ拡張
///
/// `Theme.of(context).extension<AppFeedbackColor>()` を通じて取得します。
class AppFeedbackColor extends ThemeExtension<AppFeedbackColor> {
  //
  // fields
  //

  /// 成功の表示色
  final Color success;

  /// 成功のコンテナ色
  final Color successContainer;

  /// 成功のコンテナ上のテキスト色
  final Color onSuccessContainer;

  /// 情報の表示色
  final Color info;

  /// 情報のコンテナ色
  final Color infoContainer;

  /// 情報のコンテナ上のテキスト色
  final Color onInfoContainer;

  /// 警告の表示色
  final Color warning;

  /// 警告のコンテナ色
  final Color warningContainer;

  /// 警告のコンテナ上のテキスト色
  final Color onWarningContainer;

  //
  // constructor
  //

  const AppFeedbackColor({
    required this.success,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.info,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
  });

  //
  // public methods
  //

  @override
  AppFeedbackColor copyWith({
    Color? success,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? info,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
  }) {
    return AppFeedbackColor(
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      info: info ?? this.info,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
    );
  }

  @override
  AppFeedbackColor lerp(covariant AppFeedbackColor? other, double t) {
    if (other == null) return this;

    return AppFeedbackColor(
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      onSuccessContainer: Color.lerp(
        onSuccessContainer,
        other.onSuccessContainer,
        t,
      )!,
      info: Color.lerp(info, other.info, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      onWarningContainer: Color.lerp(
        onWarningContainer,
        other.onWarningContainer,
        t,
      )!,
    );
  }
}
