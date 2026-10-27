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

    const menuWidth = 80.0; // メニュー幅
    const rightGap = 8.0; // 右端の余白

    return MenuAnchor(
      animated: true,
      reservedPadding: const EdgeInsets.only(right: 8),
      style: const MenuStyle(
        minimumSize: WidgetStatePropertyAll(Size(menuWidth, 0)),
        maximumSize: WidgetStatePropertyAll(Size(menuWidth, double.infinity)),
        elevation: WidgetStatePropertyAll(16),
        shadowColor: WidgetStatePropertyAll(Colors.black45),
      ),
      menuChildren: entries
          .map(
            (e) => MenuItemButton(
              onPressed: e.onSelected,
              style: MenuItemButton.styleFrom(
                fixedSize: const Size.fromWidth(80),
              ),
              leadingIcon: Icon(e.leading, size: AppIconSize.sm),
              child: Text(e.label, style: theme.textTheme.labelLarge),
            ),
          )
          .toList(),
      builder: (_, MenuController controller, Widget? child) {
        return IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
              return;
            }

            final overlay =
                Overlay.of(context).context.findRenderObject()! as RenderBox;
            final button = context.findRenderObject()! as RenderBox;
            final buttonOrigin = button.localToGlobal(
              Offset.zero,
              ancestor: overlay,
            );

            controller.open(
              position: Offset(
                overlay.size.width - rightGap - menuWidth - buttonOrigin.dx,
                button.size.height,
              ),
            );
          },
        );
      },
    );
  }
}
