import 'package:flutter/material.dart';

/// 色定義
///
/// アプリで使用する色を定義するクラスです。
class AppColor {
  AppColor._(); // インスタンス化禁止

  // アプリのブランドカラー・主要操作
  static const Color primary = Color(0xFFffd803);
  static const Color secondary = Color(0xffe3f6f5);
  static const Color accent = Color(0xff272343);

  // Scaffoldなど、通常画面の背景
  static const Color lightBackground = Color(0xFFE8EDF2);
  static const Color darkBackground = Color(0xFF121212);

  // AppBarやカードなど、背景の上に配置する面
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color darkSurface = Color(0xFF1E1E1E);

  // セクションや入力エリアなど、面の中の区切り
  static const Color lightSurfaceContainer = Color(0xFFFFFFFF);
  static const Color darkSurfaceContainer = Color(0xffe3f6f5);

  // 通常画面の主要な文字・アイコン
  static const Color lightOnSurface = Color(0xFF333333);
  static const Color darkOnSurface = Color(0xFFE6E0E9);

  // 補足説明やプレースホルダーなどの薄い文字
  static const Color lightOnSurfaceVariant = Color(0xFF757575);
  static const Color darkOnSurfaceVariant = Color(0xFFCAC4D0);

  // 主要ボタン上の文字・アイコン
  static const Color onPrimary = Color(0xff272343);

  // 枠線・区切り線
  static const Color outline = Color(0xFFE0E0E0);
  static const Color darkOutline = Color(0xFF555555);

  // カードやコンテナの影
  static const Color shadow = Color(0x1A000000);

  // 状態表示・補助色
  static const Color red = Color(0xffD32F2F);
  static const Color blue = Color(0xff1E88E5);
  static const Color green = Color(0xff43A047);
  static const Color grey = Color(0xff757575);
  static const Color lightGrey = Color(0xffEEEEEE);
  static const Color white = Color(0xffffffff);
}
