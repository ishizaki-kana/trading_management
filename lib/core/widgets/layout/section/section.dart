import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';

/// セクション
///
/// - [title] タイトル
/// - [children] 子要素
class Section extends StatelessWidget {
  //
  // fields
  //

  /// タイトル
  final String? title;

  /// 子要素
  final List<Widget> children;

  //
  // constructor
  //

  const Section({super.key, this.title, required this.children});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Label(title!),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.s8,
          children: children,
        ),
      ],
    );
  }
}
