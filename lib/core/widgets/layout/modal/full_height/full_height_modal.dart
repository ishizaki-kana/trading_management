import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/heading/heading.dart';
import 'package:trading_management/core/widgets/form/button/app_button_config.dart';
import 'package:trading_management/core/widgets/layout/bottom_action_bar/bottom_action_bar.dart';

/// フルスクリーンモーダル画面
///
/// - [child] モーダルの内容
/// - [title] モーダルのタイトル
/// - [positiveBtnConfig] ポジティブボタンコンフィグ
/// - [isScrollable] コンテンツをスクロール可能にするかどうか
class FullHeightModal extends StatelessWidget {
  //
  // fields
  //

  /// 子要素
  final Widget child;

  /// タイトル
  final String? title;

  /// ポジティブボタンコンフィグ
  final AppButtonConfig? positiveBtnConfig;

  /// コンテンツをスクロール可能にするかどうか
  final bool isScrollable;

  //
  // constructor
  //

  const FullHeightModal({
    super.key,
    required this.child,
    this.title,
    this.positiveBtnConfig,
    this.isScrollable = true,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final topMargin = AppSpacing.s12;

    return SizedBox(
      height: screenHeight - topMargin,
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: AppRadius.r16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              height: AppSpacing.s56,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.outline,
                    width: 1.0,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  // タイトル
                  if (title != null) Center(child: Heading(title!)),
                  // 閉じるボタン
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.s4),
                      child: CloseButton(
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Material(
                color: theme.colorScheme.surface,
                child: _buildContent(context),
              ),
            ),
            if (positiveBtnConfig case final config?)
              BottomActionBar(config: config),
          ],
        ),
      ),
    );
  }

  //
  // private methods
  //

  /// モーダルコンテンツを構築します。
  Widget _buildContent(BuildContext context) {
    final content = Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.pageVertical(context),
        bottom: AppSpacing.pageVertical(context),
        left: AppSpacing.pageHorizontal(context),
        right: AppSpacing.pageHorizontal(context) + AppSpacing.s12,
      ),
      child: child,
    );

    return isScrollable ? SingleChildScrollView(child: content) : content;
  }
}
