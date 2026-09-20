import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

/// セクションカード
///
/// - [title] タイトル
/// - [leading] アイコン
/// - [color] 背景色
/// - [child] 子要素
class SectionCard extends StatelessWidget {
  //
  // fields
  //

  /// タイトル
  final String? title;

  /// アイコン
  final Widget? leading;

  /// 背景色
  final Color? color;

  /// 子要素
  final Widget child;

  //
  // constructor
  //

  const SectionCard({
    super.key,
    required this.child,
    this.title,
    this.leading,
    this.color,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: AppSpacing.s12,
        bottom: AppSpacing.s16,
        right: AppSpacing.s16,
        left: AppSpacing.s16,
      ),
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.surfaceContainer,
        borderRadius: AppRadius.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.s8,
        children: [
          if (title != null || leading != null)
            Row(
              spacing: AppSpacing.s12,
              children: [
                ?leading,
                if (title != null) Expanded(child: SectionTitle(text: title!)),
              ],
            ),
          child,
        ],
      ),
    );
  }
}
