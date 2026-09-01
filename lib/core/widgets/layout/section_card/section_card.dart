import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

/// セクションカード
///
/// - [child] 子要素
/// - [title] タイトル
/// - [titleLeading] タイトルの左側に表示するウィジェット
/// - [color] 背景色
class SectionCard extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? titleLeading;
  final Color? color;

  const SectionCard({
    super.key,
    required this.child,
    this.title,
    this.titleLeading,
    this.color,
  });

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
          if (title != null || titleLeading != null)
            Row(
              spacing: AppSpacing.s12,
              children: [
                ?titleLeading,
                if (title != null) SectionTitle(text: title!),
              ],
            ),

          child,
        ],
      ),
    );
  }
}
