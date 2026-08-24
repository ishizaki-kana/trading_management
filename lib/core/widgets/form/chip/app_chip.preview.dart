import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/chip/app_chip.dart';

@AppPreview(group: 'form/chip')
Widget appChipPreview() {
  return const Scaffold(
    body: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppChip(label: 'Selected'),
          SizedBox(width: 8),
          AppChip(label: 'Unselected', isSelected: false),
        ],
      ),
    ),
  );
}
