import 'package:flutter/material.dart';
import 'package:trading_management/core/form/app_form_field.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/form/field/date/date_field.dart';

const _group = 'form/field/date';

@AppPreview(group: _group, name: 'With label', size: Size(360, 190))
Widget appDateFieldWithLabelPreview() {
  return _buildPreview(
    DateField(
      AppFormField(id: 'traded_at', name: '取引日', value: DateTime(2030, 1, 1)),
    ),
  );
}

@AppPreview(group: _group, name: 'Without label', size: Size(360, 120))
Widget appDateFieldWithoutLabelPreview() {
  return _buildPreview(
    DateField(
      AppFormField(id: 'traded_at', name: '取引日', value: DateTime(2030, 1, 1)),
      showLabel: false,
    ),
  );
}

Widget _buildPreview(DateField dateField) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(child: dateField),
    ),
  );
}
