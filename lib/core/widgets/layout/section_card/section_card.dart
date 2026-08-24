import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

/// セクションカード
class SectionCard extends StatelessWidget {
  final Widget child;
  final String? title;

  const SectionCard({super.key, this.title, required this.child});

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
        color: theme.colorScheme.surfaceContainer,
        borderRadius: AppRadius.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.s8,
        children: [
          if (title != null) SectionTitle(text: title!),
          child,
        ],
      ),
    );
  }
}
