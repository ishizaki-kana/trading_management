import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_string.dart';
import 'package:trading_management/core/theme/app_theme.dart';
import 'package:trading_management/features/onboarding/presentation/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WelcomeScreen(),
    );
  }
}
