import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

/// セクション
///
/// - [title] タイトル
/// - [child] 子要素
class Section extends StatelessWidget {
  //
  // fields
  //

  /// タイトル
  final String? title;

  /// 子要素
  final Widget child;

  //
  // constructor
  //

  const Section({super.key, this.title, required this.child});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.s8,
      children: [
        if (title != null) SectionTitle(text: title!),
        child,
      ],
    );
  }
}
