import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_string.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_theme.dart';
import 'package:trading_management/features/onboarding/presentation/pages/welcome_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // Flutter初期化
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase初期化
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 未処理の例外を Firebase の Crashlytics に送信
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    return true;
  };

  final database = AppDatabase();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({required this.database, super.key});

  @override
  Widget build(BuildContext context) {
    return AppDatabaseScope(
      database: database,
      child: MaterialApp(
        title: AppString.appTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const WelcomeScreen(),
      ),
    );
  }
}
