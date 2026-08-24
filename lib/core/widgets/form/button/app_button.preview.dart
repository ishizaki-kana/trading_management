import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/button/app_button.dart';

const _group = 'form/button';

@AppPreview(group: _group, name: 'Primary')
Widget primary() {
  return _preview(onPressed: () => {});
}

@AppPreview(group: _group, name: 'Disabled')
Widget disabled() {
  return _preview();
}

@AppPreview(group: _group, name: 'Loading')
Widget loading() {
  return _preview(isLoading: true);
}

Widget _preview({Function()? onPressed, bool? isLoading}) {
  return Scaffold(
    body: Center(
      child: AppButton(
        onPressed: onPressed,
        isLoading: isLoading ?? false,
        text: 'text',
      ),
    ),
  );
}
