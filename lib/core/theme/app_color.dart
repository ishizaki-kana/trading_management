import 'package:flutter/material.dart';

/// 色定義
///
/// アプリで使用する色を定義するクラスです。
class AppColor {
  AppColor._(); // インスタンス化禁止

  // app
  static const Color primary = Color(0xFFffd803);
  static const Color secondary = Color(0xffe3f6f5);
  static const Color accent = Color(0xff272343);

  // background
  static const Color background = Color(0xFFf5f5f5);
  static const Color surface = Color(0xFFfffffe);
  static const Color surfaceContainer = Color(0xFFf5f5f5);

  // text
  static const Color onPrimary = Color(0xff272343);
  static const Color onSurface = Color(0xFF333333);
  static const Color onSurfaceVariant = Color(0xFF757575);
  static const Color onDark = Colors.white;

  // outline
  static const Color outline = Color(0xFFE0E0E0);

  // shadow
  static const Color shadow = Color(0x1A000000);

  // color
  static const Color red = Color(0xffD32F2F);
  static const Color blue = Color(0xff1E88E5);
  static const Color green = Color(0xff43A047);
  static const Color grey = Color(0xff757575);
  static const Color lightGrey = Color(0xffEEEEEE);
  static const Color white = Color(0xffffffff);
}
