import 'package:flutter/material.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';
import 'package:trading_management/features/home/presentation/pages/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppButton(
        text: 'start',
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    );
  }
}
