import 'package:flutter/material.dart';

/// ボタンコンフィグ
class AppButtonConfig {
  //
  // fields
  //

  /// テキスト
  final String? text;

  /// パディング
  final EdgeInsetsGeometry? padding;

  /// ローディング中か
  final bool? isLoading;

  /// 横幅拡張
  final bool? isFullWidth;

  /// ボタンタップ時のコールバック
  final VoidCallback? onPressed;

  //
  // constructor
  //

  const AppButtonConfig({
    this.text,
    this.padding,
    this.isLoading,
    this.isFullWidth,
    this.onPressed,
  });
}
