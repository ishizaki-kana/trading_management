import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';

const _group = 'display/typography/label';

@AppPreview(group: _group, name: 'Default')
Widget labelPreview() {
  return const Scaffold(body: Center(child: Label('取引相手')));
}

@AppPreview(group: _group, name: 'Required')
Widget labelRequiredPreview() {
  return const Scaffold(body: Center(child: Label('取引相手', isRequired: true)));
}

@AppPreview(group: _group, name: 'Variant')
Widget labelVariantPreview() {
  return const Scaffold(body: Center(child: Label('補足情報', isVariant: true)));
}
