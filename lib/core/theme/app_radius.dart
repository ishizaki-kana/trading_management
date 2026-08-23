import 'package:flutter/material.dart';

/// 角丸定義
///
/// アプリで使用する角丸を定義するクラスです。
class AppRadius {
  AppRadius._();

  static const double r4 = 4;
  static const double r8 = 8;
  static const double r12 = 12;
  static const double r16 = 16;

  /// 角丸 `4px`
  static const BorderRadius xs = BorderRadius.all(Radius.circular(r4));

  /// 角丸 `8px`
  static const BorderRadius sm = BorderRadius.all(Radius.circular(r8));

  /// 角丸 `12px`
  static const BorderRadius md = BorderRadius.all(Radius.circular(r12));

  /// 角丸 `16px`
  static const BorderRadius lg = BorderRadius.all(Radius.circular(r16));

  /// 円形の角丸
  static const BorderRadius circle = BorderRadius.all(Radius.circular(999));
}
