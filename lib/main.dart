import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_string.dart';
import 'package:trading_management/core/data/database/app_database.dart';
import 'package:trading_management/core/data/database/app_database.scope.dart';
import 'package:trading_management/core/theme/app_theme.dart';
import 'package:trading_management/features/onboarding/presentation/pages/welcome_screen.dart';

Future<void> main() async {
  // Flutter初期化
  WidgetsFlutterBinding.ensureInitialized();

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
