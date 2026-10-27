import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/core/theme/app_feedback_color.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';

/// アプリ共通のテーマ
abstract final class AppTheme {
  //
  // color
  //

  /// ライトモード
  static final ThemeData light = _create(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      tertiary: AppColor.accent,
      surface: AppColor.lightSurface, // 基本的な面
      surfaceContainer: AppColor.lightSurfaceContainer, // コンテナ面
      surfaceContainerLow: AppColor.lightSurfaceContainerLow,
      outline: AppColor.outline, // 枠線
      shadow: AppColor.lightShadow, // 影
      onPrimary: AppColor.onPrimary, // primary 背景上の文字
      onSurface: AppColor.lightOnSurface, // surface 上の文字
      onSurfaceVariant: AppColor.lightOnSurfaceVariant, // 補助文字
    ),
    scaffoldBackgroundColor: AppColor.lightBackground,
  );

  /// ダークモード
  static final ThemeData dark = _create(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      tertiary: AppColor.accent,
      surface: AppColor.darkSurface, // 基本的な面
      surfaceContainer: AppColor.darkSurfaceContainer, // コンテナ面
      surfaceContainerLow: AppColor.darkSurfaceContainerLow,
      outline: AppColor.darkOutline, // 枠線
      shadow: AppColor.darkShadow, // 影
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
      info: infoScheme.primary,
      infoContainer: infoScheme.primaryContainer,
      warning: warningScheme.primary,
      warningContainer: warningScheme.primaryContainer,
    );
  }

  //
  // widget
  //

  //
  // text
  //

  /// テキストフィールド
  static InputDecorationThemeData _inputDecorationTheme(
    ColorScheme colorScheme,
  ) {
    return InputDecorationThemeData(
      border: const OutlineInputBorder(), // 枠線あり
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.onSurface, // フォーカス時の枠線
          width: 2.0,
        ),
      ),
      errorMaxLines: 3,
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }

  /// テキスト選択時
  static TextSelectionThemeData _textSelectionTheme(ColorScheme colorScheme) {
    return TextSelectionThemeData(
      cursorColor: colorScheme.onSurface, // カーソル
      selectionColor: colorScheme.onSurface.withValues(alpha: 0.2), // 選択範囲
      selectionHandleColor: colorScheme.onSurface, // 選択範囲を変更する丸いハンドル
    );
  }

  /// 日付ピッカー
  static DatePickerThemeData _datePickerTheme(ColorScheme colorScheme) {
    // 日付数字
    final dayForegroundColor = WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurfaceVariant; // 無効時
      }
      if (states.contains(WidgetState.selected)) {
        return colorScheme.onPrimary; // 選択時
      }
      return colorScheme.onSurface; // 未選択時
    });

    // 日付背景
    final dayBackgroundColor = WidgetStateProperty.resolveWith((states) {
      // 選択時
      if (states.contains(WidgetState.selected)) {
        return AppColor.primary;
      }
      // 未選択時・無効時
      return colorScheme.surface;
    });

    return DatePickerThemeData(
      dayForegroundColor: dayForegroundColor,
      todayForegroundColor: dayForegroundColor,
      dayBackgroundColor: dayBackgroundColor,
      todayBackgroundColor: dayBackgroundColor,
      backgroundColor: colorScheme.surface,
      headerBackgroundColor: AppColor.primary,
      headerForegroundColor: AppColor.accent,
    );
  }

  //
  // button
  //

  /// 塗りつぶしボタン
  static ElevatedButtonThemeData _elevatedButtonThemeData(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s20,
        ),
        backgroundColor: AppColor.primary, // 背景色
        foregroundColor: colorScheme.onPrimary, // 文字色
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md), // 角丸
        textStyle: const TextStyle(fontWeight: FontWeight.bold), // テキストスタイル
      ),
    );
  }

  /// テキストボタン
  static TextButtonThemeData _textButtonThemeData(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: AppColor.grey, // タップ時の背景色
        foregroundColor: colorScheme.onSurface, // 文字色
      ),
    );
  }

  //
  // checkbox
  //

  /// チェックボックス
  static CheckboxThemeData _checkboxTheme() {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.primary; // 選択時の色
        }
        return AppColor.white; // 未選択時の色
      }),
    );
  }

  /// チェックボックスタイル
  static ListTileThemeData checkboxTileTheme(ThemeData theme) {
    return theme.listTileTheme.copyWith(
      controlAffinity: ListTileControlAffinity.leading,
      tileColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: AppSpacing.s8,
      titleTextStyle: theme.textTheme.bodyMedium,
    );
  }

  //
  // search bar
  //

  /// 検索バー
  static SearchBarThemeData _searchBarTheme(ColorScheme colorScheme) {
    return SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(colorScheme.surfaceContainerLow),
    );
  }

  //
  // icon
  //

  /// アイコン
  static IconThemeData _iconTheme() {
    return IconThemeData(color: AppColor.grey);
  }

  //
  // theme
  //

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
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
      datePickerTheme: _datePickerTheme(colorScheme),
      textSelectionTheme: _textSelectionTheme(colorScheme),
      elevatedButtonTheme: _elevatedButtonThemeData(colorScheme),
      textButtonTheme: _textButtonThemeData(colorScheme),
      checkboxTheme: _checkboxTheme(),
      iconTheme: _iconTheme(),
      searchBarTheme: _searchBarTheme(colorScheme),
      extensions: [
        _createFeedbackColors(colorScheme.brightness), // 成功・情報・警告で使うテーマ色
      ],
    );
  }
}
