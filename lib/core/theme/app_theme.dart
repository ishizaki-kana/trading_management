import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_feedback_color.dart';

/// アプリ共通のテーマ
abstract final class AppTheme {
  /// ライトモード
  static final ThemeData light = _create(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      tertiary: AppColor.accent,
      brightness: Brightness.light,
      surface: AppColor.lightSurface, // 基本的な面
      surfaceContainer: AppColor.lightSurfaceContainer, // コンテナ面
      surfaceContainerLow: AppColor.lightGrey,
      outline: AppColor.outline, // 枠線
      shadow: AppColor.shadow, // 影
      onPrimary: AppColor.onPrimary, // primary 背景上の文字
      onSurface: AppColor.lightOnSurface, // surface 上の文字
      onSurfaceVariant: AppColor.lightOnSurfaceVariant, // 補助文字
    ),
    scaffoldBackgroundColor: AppColor.lightBackground,
  );

  /// ダークモード
  static final ThemeData dark = _create(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      tertiary: AppColor.accent,
      brightness: Brightness.dark,
      surface: AppColor.darkSurface, // 基本的な面
      surfaceContainer: AppColor.darkSurfaceContainer, // コンテナ面
      outline: AppColor.darkOutline, // 枠線
      shadow: Colors.black, // 影
      onPrimary: AppColor.onPrimary, // primary 背景上の文字
      onSurface: AppColor.darkOnSurface, // surface 上の文字
      onSurfaceVariant: AppColor.darkOnSurfaceVariant, // 補助文字
    ),
    scaffoldBackgroundColor: AppColor.darkBackground,
  );

  /// 状態種別
  static AppFeedbackColor _createFeedbackColors(Brightness brightness) {
    final successScheme = ColorScheme.fromSeed(
      seedColor: AppColor.success,
      brightness: brightness,
    );
    final infoScheme = ColorScheme.fromSeed(
      seedColor: AppColor.info,
      brightness: brightness,
    );
    final warningScheme = ColorScheme.fromSeed(
      seedColor: AppColor.warning,
      brightness: brightness,
    );

    return AppFeedbackColor(
      success: successScheme.primary,
      successContainer: successScheme.primaryContainer,
      onSuccessContainer: successScheme.onPrimaryContainer,
      info: infoScheme.primary,
      infoContainer: infoScheme.primaryContainer,
      onInfoContainer: infoScheme.onPrimaryContainer,
      warning: warningScheme.primary,
      warningContainer: warningScheme.primaryContainer,
      onWarningContainer: warningScheme.onPrimaryContainer,
    );
  }

  static ThemeData _create({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontWeight: FontWeight.bold),
      ),
      // ボタン
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // テキストフィールド
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.accent, width: 2),
        ),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(color: AppColor.error);
          }
          if (states.contains(WidgetState.focused)) {
            return const TextStyle(color: AppColor.accent);
          }
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }),
      ),
      // テキスト選択時
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.accent,
        selectionColor: AppColor.accent.withAlpha(50),
        selectionHandleColor: AppColor.accent,
      ),
      // チェックボックス
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColor.primary;
          }
          return AppColor.white;
        }),
        checkColor: WidgetStateProperty.resolveWith((_) => AppColor.onPrimary),
        side: BorderSide(color: colorScheme.outline, width: 2),
      ),
      // プログレスバー
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.grey,
      ),
      // 検索バー背景
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll(
          colorScheme.surfaceContainerLow,
        ),
      ),
      extensions: [
        // 成功・情報・警告で使うテーマ色
        _createFeedbackColors(colorScheme.brightness),
      ],
    );
  }
}
