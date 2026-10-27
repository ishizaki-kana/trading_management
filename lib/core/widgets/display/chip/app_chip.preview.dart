import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/display/chip/app_chip.dart';

const _group = 'display/chip';

@AppPreview(group: _group, name: 'Default', size: Size(360, 160))
Widget appChipDefaultPreview() {
  return _buildPreview(const AppChip('交換'));
}

@AppPreview(group: _group, name: 'Custom color', size: Size(360, 160))
Widget appChipCustomColorPreview() {
  return _buildPreview(const AppChip('手渡し', color: Colors.orange));
}

Widget _buildPreview(AppChip chip) {
  return Scaffold(body: Center(child: chip));
}
