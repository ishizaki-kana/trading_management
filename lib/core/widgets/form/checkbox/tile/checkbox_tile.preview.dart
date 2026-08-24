import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';

@AppPreview(group: 'form/checkbox/tile')
Widget checkboxTilePreview() {
  var option = const CheckboxOption(
    value: 'sample',
    label: 'サンプル項目',
    checked: false,
  );

  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: StatefulBuilder(
        builder: (context, setState) {
          return CheckboxTile(
            option: option,
            onChanged: (newOption) {
              setState(() {
                option = newOption;
              });
            },
          );
        },
      ),
    ),
  );
}
