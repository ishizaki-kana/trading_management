import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:trading_management/core/theme/app_theme.dart';

/// アプリ共通の Widget Preview アノテーション
final class AppPreview extends Preview {
  /// デフォルト Preview
  const AppPreview({super.name, super.group, super.size = const Size(320, 120)})
    : super(brightness: Brightness.light, theme: AppPreview.themeBuilder);

  /// Previewer に適用するアプリ共通テーマ。
  static PreviewThemeData themeBuilder() {
    return PreviewThemeData(
      materialLight: AppTheme.light,
      materialDark: AppTheme.dark,
    );
  }
}
