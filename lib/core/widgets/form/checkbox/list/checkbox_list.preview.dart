import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/checkbox/checkbox_option.dart';
import 'package:trading_management/core/widgets/form/checkbox/list/checkbox_list.dart';

const _group = 'form/checkbox/list';

@AppPreview(group: _group, name: 'With label', size: Size(360, 230))
Widget checkboxListWithLabelPreview() {
  return _buildPreview(label: '支払い方法');
}

@AppPreview(group: _group, name: 'Without label', size: Size(360, 200))
Widget checkboxListWithoutLabelPreview() {
  return _buildPreview();
}

Widget _buildPreview({String? label}) {
  const options = [
    CheckboxOption(value: 'one', label: '項目1'),
    CheckboxOption(value: 'two', label: '項目2'),
    CheckboxOption(value: 'three', label: '項目3'),
  ];
  var selectedValues = <String>['one'];

  return Scaffold(
    body: StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: CheckboxList<String>(
            AppFormField(
              id: 'paymentMethods',
              name: label ?? '支払い方法',
              value: selectedValues,
            ),
            options: options,
            showLabel: label != null,
            onChanged: (values) {
              setState(() => selectedValues = values);
            },
          ),
        );
      },
    ),
  );
}
