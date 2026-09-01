import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';

/// アプリ共通のテーマ。
abstract final class AppTheme {
  static final ThemeData light = _create(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      brightness: Brightness.light,
      surface: AppColor.lightSurface,
      surfaceContainer: AppColor.lightSurfaceContainer,
      surfaceContainerLow: AppColor.lightGrey,
      outline: AppColor.outline,
      shadow: AppColor.shadow,
      onPrimary: AppColor.onPrimary,
      onSurface: AppColor.lightOnSurface,
      onSurfaceVariant: AppColor.lightOnSurfaceVariant,
    ),
    scaffoldBackgroundColor: AppColor.lightBackground,
  );

  static final ThemeData dark = _create(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      brightness: Brightness.dark,
      surface: AppColor.darkSurface,
      surfaceContainer: AppColor.darkSurfaceContainer,
      outline: AppColor.darkOutline,
      shadow: Colors.black,
      onPrimary: AppColor.onPrimary,
      onSurface: AppColor.darkOnSurface,
      onSurfaceVariant: AppColor.darkOnSurfaceVariant,
    ),
    scaffoldBackgroundColor: AppColor.darkBackground,
  );

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
            return const TextStyle(color: AppColor.red);
          }
          if (states.contains(WidgetState.focused)) {
            return const TextStyle(color: AppColor.accent);
          }
          return TextStyle(color: colorScheme.onSurfaceVariant);
        }),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.accent,
        selectionColor: AppColor.accent.withAlpha(50),
        selectionHandleColor: AppColor.accent,
      ),
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
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.grey,
      ),
    );
  }
}
