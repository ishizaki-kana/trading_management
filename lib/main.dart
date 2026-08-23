import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_color.dart';
import 'package:trading_management/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'グッズ交換管理',
      debugShowCheckedModeBanner: false, // デバッグバナー非表示
      theme: ThemeData(
        useMaterial3: true,
        // テキスト
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontWeight: FontWeight.bold),
        ),
        // テーマ色
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
          surface: AppColor.surface,
          surfaceContainer: AppColor.surfaceContainer,
          outline: AppColor.outline,
          shadow: AppColor.shadow,
          onPrimary: AppColor.onPrimary,
          onSurface: AppColor.onSurface,
          onSurfaceVariant: AppColor.onSurfaceVariant,
        ),
        // 画面背景色
        scaffoldBackgroundColor: AppColor.background,
        // ボタンの色
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
        // テキストフィールドの色
        inputDecorationTheme: InputDecorationTheme(
          // ボーダーの色
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.accent, width: 2),
          ),
          // ラベルの色
          floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return const TextStyle(color: AppColor.red);
            }
            if (states.contains(WidgetState.focused)) {
              return const TextStyle(color: AppColor.accent);
            }
            return const TextStyle(color: AppColor.onSurfaceVariant);
          }),
        ),
        // テキスト選択の色
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.accent,
          selectionColor: AppColor.accent.withAlpha(50),
          selectionHandleColor: AppColor.accent,
        ),
        // チェックボックスの色
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.primary;
            }
            return AppColor.white;
          }),
          checkColor: WidgetStateProperty.resolveWith((states) {
            return AppColor.onPrimary;
          }),
          side: const BorderSide(color: AppColor.outline, width: 2),
        ),
        // ローディングアイコンの色
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.grey,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
