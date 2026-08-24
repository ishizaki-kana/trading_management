import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/checkbox/list/checkbox_list.dart';
import 'package:trading_management/core/widgets/form/checkbox/tile/checkbox_tile.dart';

@AppPreview(
  group: 'form/checkbox/list',
  size: Size(320, 200),
)
Widget checkboxListPreview() {
  var options = const [
    CheckboxOption(value: 'one', label: '項目1', checked: true),
    CheckboxOption(value: 'two', label: '項目2', checked: false),
    CheckboxOption(value: 'three', label: '項目3', checked: false),
  ];

  return Scaffold(
    body: StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: CheckboxList(
            options: options,
            onChanged: (newOptions) {
              setState(() {
                options = newOptions;
              });
            },
          ),
        );
      },
    ),
  );
}
