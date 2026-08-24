import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/navigation/actions/setting_button/setting_button.dart';

@AppPreview(group: 'navigation/actions/setting_button')
Widget settingButtonPreview() {
  return const Scaffold(
    body: Center(child: SettingButton()),
  );
}
