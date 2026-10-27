import 'package:flutter/material.dart';

/// 角丸定義
///
/// アプリで使用する角丸を定義するクラスです。
class AppRadius {
  AppRadius._();

  static const Radius r4 = Radius.circular(4);
  static const Radius r8 = Radius.circular(8);
  static const Radius r12 = Radius.circular(12);
  static const Radius r16 = Radius.circular(16);
  static const Radius r999 = Radius.circular(999);

  /// 角丸（全て） `4px`
  static const BorderRadius xs = BorderRadius.all(r4);

  /// 角丸（全て） `8px`
  static const BorderRadius sm = BorderRadius.all(r8);

  /// 角丸（全て） `12px`
  static const BorderRadius md = BorderRadius.all(r12);

  /// 角丸（全て） `16px`
  static const BorderRadius lg = BorderRadius.all(r16);

  /// 円形の角丸
  static const BorderRadius circle = BorderRadius.all(r999);
}
