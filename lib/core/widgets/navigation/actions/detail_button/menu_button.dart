import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/widgets/navigation/actions/detail_button/menu_entry.dart';

/// メニューボタン
///
/// サブメニューを表示するアイコンボタンを表示します。
class MenuButton<T extends MenuEntry> extends StatelessWidget {
  //
  // fields
  //

  /// メニュー要素リスト
  final List<T> entries;

  //
  // constructor
  //

  const MenuButton({super.key, required this.entries});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MenuAnchor(
      animated: true,
      reservedPadding: const EdgeInsets.only(right: 8),
      style: const MenuStyle(
        elevation: WidgetStatePropertyAll(16),
        shadowColor: WidgetStatePropertyAll(Colors.black45),
      ),
      alignmentOffset: const Offset(-32, 0),
      menuChildren: entries
          .map(
            (e) => MenuItemButton(
              onPressed: e.onSelected,
              leadingIcon: Icon(e.leading, size: AppIconSize.sm),
              child: Text(
                e.label,
                style: theme.textTheme.labelLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      builder: (anchorContext, MenuController controller, Widget? child) {
        return IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
              return;
            } else {
              controller.open();
              return;
            }
          },
        );
      },
    );
  }
}
