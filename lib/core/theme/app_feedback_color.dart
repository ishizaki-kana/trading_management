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

  /// 情報の表示色
  final Color info;

  /// 情報のコンテナ色
  final Color infoContainer;

  /// 警告の表示色
  final Color warning;

  /// 警告のコンテナ色
  final Color warningContainer;

  //
  // constructor
  //

  const AppFeedbackColor({
    required this.success,
    required this.successContainer,
    required this.info,
    required this.infoContainer,
    required this.warning,
    required this.warningContainer,
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
      info: info ?? this.info,
      infoContainer: infoContainer ?? this.infoContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
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
      info: Color.lerp(info, other.info, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
    );
  }
}
