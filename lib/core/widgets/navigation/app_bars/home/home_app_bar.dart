import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/app_icon/app_icon.dart';
import 'package:trading_management/core/widgets/navigation/actions/setting_button/setting_button.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/common/common_app_bar.dart';

/// ホームアプリバー
///
/// - [showActions] アクションボタン表示（デフォルト: true）
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showActions;

  const HomeAppBar({super.key, this.showActions = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.s8),
        child: Center(child: const AppIcon()),
      ),
      title: 'グッズ交換',
      actions: showActions ? const [SettingButton()] : const [],
    );
  }
}
