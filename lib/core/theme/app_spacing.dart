import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_breakpoint.dart';

/// 余白定義
///
/// アプリで使用する余白のサイズを定義するクラスです。
class AppSpacing {
  AppSpacing._(); // インスタンス化禁止

  //
  // 固定サイズ
  //

  static const double none = 0;
  static const double s4 = 4;
  static const double s6 = 6;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s48 = 48;

  //
  // レスポンシブ
  //

  /// ページ左右余白
  ///
  /// - モバイル: 16px
  /// - タブレット: 24px
  /// - PC: 32px
  /// - デスクトップ: 48px
  static double pageHorizontal(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (AppBreakpoint.isMobile(width)) {
      return s16;
    } else if (AppBreakpoint.isTablet(width)) {
      return s24;
    } else if (AppBreakpoint.isSmallDesktop(width)) {
      return s32;
    } else {
      return s48;
    }
  }

  /// ページ上下余白
  ///
  /// - モバイル: 16px
  /// - タブレット: 24px
  /// - PC: 32px
  /// - デスクトップ: 48px
  static double pageVertical(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (AppBreakpoint.isMobile(width)) {
      return s16;
    } else if (AppBreakpoint.isTablet(width)) {
      return s24;
    } else if (AppBreakpoint.isSmallDesktop(width)) {
      return s32;
    } else {
      return s48;
    }
  }
}
