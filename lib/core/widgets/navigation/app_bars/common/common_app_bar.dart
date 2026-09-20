import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/heading/heading.dart';

/// 汎用アプリバー
///
/// - [title] タイトル
/// - [leading] アイコン
/// - [actions] アクションボタンリスト
/// - [isCenterTitle] タイトルを中央に表示するかどうか（デフォルト：false）
/// - [showCloseButton] 閉じるボタン表示するかどうか（デフォルト：false）
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  //
  // fields
  //

  /// タイトル
  final String? title;

  /// アイコン
  final Widget? leading;

  /// アクションボタンリスト
  final List<Widget> actions;

  /// タイトルを中央に表示するかどうか
  final bool isCenterTitle;

  /// 閉じるボタンを表示するかどうか
  final bool showCloseButton;

  //
  // constructor
  //

  const CommonAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions = const [],
    this.isCenterTitle = false,
    this.showCloseButton = false,
  });

  //
  // getter
  //

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      leading: _buildLeading(context),
      title: title == null ? null : Heading(text: title!),
      titleSpacing: AppSpacing.s8,
      centerTitle: isCenterTitle,
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: AppSpacing.s8),
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }

  //
  // private methods
  //

  /// アイコン生成
  ///
  /// - `showCloseButton`が`true`のとき、閉じるボタンを表示します。
  /// - `leading`が指定されているとき、指定したアイコンを表示します。
  /// - それ以外の時は何も表示しません。
  Widget? _buildLeading(BuildContext context) {
    // 閉じるボタン
    if (showCloseButton) {
      return const CloseButton();
    }

    // アイコン
    if (leading != null) {
      return Padding(
        padding: const EdgeInsets.only(left: AppSpacing.s8),
        child: Center(child: leading),
      );
    }

    return null;
  }
}
