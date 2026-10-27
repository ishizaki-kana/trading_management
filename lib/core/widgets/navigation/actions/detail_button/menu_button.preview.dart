import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/navigation/actions/detail_button/menu_button.dart';
import 'package:trading_management/core/widgets/navigation/actions/detail_button/menu_entry.dart';

const _group = 'navigation/actions/detail_button';

@AppPreview(group: _group, size: Size(360, 200))
Widget menuButtonPreview() {
  var selectedLabel = '未選択';

  return StatefulBuilder(
    builder: (context, setState) {
      final entries = [
        MenuEntry(
          label: '編集',
          leading: Icons.edit_outlined,
          onSelected: () {
            setState(() {
              selectedLabel = '編集';
            });
          },
        ),
        MenuEntry(
          label: '削除',
          leading: Icons.delete_outline,
          onSelected: () {
            setState(() {
              selectedLabel = '削除';
            });
          },
        ),
      ];

      return Scaffold(
        appBar: AppBar(actions: [MenuButton(entries: entries)]),
        body: Center(child: Text('選択中: $selectedLabel')),
      );
    },
  );
}
