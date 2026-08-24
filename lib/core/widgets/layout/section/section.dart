import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

/// セクション
class Section extends StatelessWidget {
  final Widget child;
  final String? title;
  final EdgeInsetsGeometry? padding;

  const Section({super.key, required this.child, this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
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
