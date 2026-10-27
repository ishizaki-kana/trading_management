import 'package:flutter/material.dart';
import 'package:trading_management/core/navigation/app_navigator.dart';
import 'package:trading_management/core/widgets/navigation/actions/detail_button/menu_button.dart';
import 'package:trading_management/core/widgets/navigation/actions/detail_button/menu_entry.dart';
import 'package:trading_management/features/onboarding/presentation/pages/welcome_screen.dart';
import 'package:trading_management/features/trade/application/models/trade_detail.dart';
import 'package:trading_management/features/trade/presentation/modals/trade_edit_modal.dart';

/// 取引詳細メニューボタン
///
/// 取引の編集・削除を行うメニューボタンを表示します。
///
/// - [trade] 取引詳細
/// - [onUpdated] 更新時のコールバック
class DetailMenuButton extends StatelessWidget {
  //
  // fields
  //

  /// 取引詳細
  final TradeDetail? trade;

  /// 更新時のコールバック
  final Future<void> Function()? onUpdated;

  //
  // constructor
  //

  const DetailMenuButton({super.key, this.trade, this.onUpdated});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final entries = [
      MenuEntry(
        label: '編集',
        leading: Icons.edit,
        onSelected: () async {
          final updated = await AppNavigator.pushFullHeightModal(
            context,
            TradeEditModal(trade: trade),
          );

          if (updated == true && context.mounted) {
            await onUpdated?.call();
          }
        },
      ),
      MenuEntry(
        label: '削除',
        leading: Icons.delete,
        onSelected: () => AppNavigator.push(context, const WelcomeScreen()),
      ),
    ];

    return MenuButton(entries: entries);
  }
}
