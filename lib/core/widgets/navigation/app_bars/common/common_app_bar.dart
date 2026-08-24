import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/heading/heading.dart';

/// 汎用アプリバー
///
/// - [leading] アイコン
/// - [title] タイトル
/// - [actions] アクションボタンリスト
/// - [centerTitle] タイトルを中央に表示するかどうか（デフォルト：false）
/// - [showCloseButton] 閉じるボタン表示（デフォルト：false）
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final List<Widget> actions;
  final bool centerTitle;
  final bool showCloseButton;

  const CommonAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions = const [],
    this.centerTitle = false,
    this.showCloseButton = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      leading: _buildLeading(context),
      title: title == null ? null : Heading(text: title!),
      titleSpacing: AppSpacing.s8,
      centerTitle: centerTitle,
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: AppSpacing.s8),
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
    );
  }

  /// アイコン生成
  ///
  /// - `showCloseButton`が`true`のとき、閉じるボタンを表示します。
  /// - `leading`が指定されているとき、指定したアイコンを表示します。
  /// - それ以外の時は何も表示しません。
  Widget? _buildLeading(BuildContext context) {
    // 閉じるボタン
    if (showCloseButton) {
      return IconButton(
        icon: const Icon(Icons.close),
        onPressed: Navigator.canPop(context)
            ? () => Navigator.pop(context)
            : null,
      );
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
