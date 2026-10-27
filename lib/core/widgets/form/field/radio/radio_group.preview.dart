import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_group.dart';
import 'package:trading_management/core/widgets/form/field/radio/radio_option.dart';

const _group = 'form/field/radio';

@AppPreview(group: _group, name: 'With label', size: Size(360, 190))
Widget radioListWithLabelPreview() {
  return _buildPreview(name: '取引種別');
}

@AppPreview(group: _group, name: 'Without label', size: Size(360, 160))
Widget radioListWithoutLabelPreview() {
  return _buildPreview(name: null);
}

Widget _buildPreview({required String? name}) {
  const options = [
    RadioOption(value: 1, label: '交換', selectedColor: Colors.blue),
    RadioOption(value: 2, label: '譲渡', selectedColor: Colors.orange),
    RadioOption(value: 3, label: '買取', selectedColor: Colors.green),
  ];
  var selectedValue = 1;

  return Scaffold(
    body: StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: AppRadioGroup(
            AppFormField(
              id: 'tradeType',
              name: name ?? '取引種別',
              value: selectedValue,
            ),
            options: options,
            showLabel: name != null,
            onSelected: (value) {
              setState(() => selectedValue = value);
            },
          ),
        );
      },
    ),
  );
}
