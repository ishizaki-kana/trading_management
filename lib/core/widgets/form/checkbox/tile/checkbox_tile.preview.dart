import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';

@AppPreview(
  group: 'form/checkbox/tile',
  name: 'Interactive',
  size: Size(360, 160),
)
Widget checkboxTilePreview() {
  var field = const AppFormField(
    id: 'is_prepaid',
    name: '先払いにする',
    value: false,
  );

  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: StatefulBuilder(
        builder: (context, setState) {
          return CheckboxTile(
            field,
            onChanged: (value) {
              setState(() {
                field = field.copyWith(value: value);
              });
            },
          );
        },
      ),
    ),
  );
}
