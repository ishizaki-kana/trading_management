import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/section_title/section_title.dart';

/// セクション
///
/// - [title] タイトル
/// - [padding]　パディング （デフォルト: `horizontal: AppSpacing.s24`）
/// - [child] 子要素
class Section extends StatelessWidget {
  //
  // fields
  //

  /// タイトル
  final String? title;

  /// パディング
  final EdgeInsetsGeometry padding;

  /// 子要素
  final Widget child;

  //
  // constructor
  //

  const Section({
    super.key,
    this.title,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
    required this.child,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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
