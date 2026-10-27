import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_radius.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/core/widgets/display/typography/label/label.dart';

/// セクションカード
///
/// タイトルを持つタップ可能なカードを表示します。
///
/// - [child] 子要素
/// - [title] タイトル
/// - [leading] アイコン
/// - [onTap] タップ時のコールバック
class SectionCard extends StatelessWidget {
  //
  // fields
  //

  /// 子要素
  final Widget child;

  /// タイトル
  final String? title;

  /// アイコン
  final Widget? leading;

  /// 背景色
  final Color? color;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  //
  // constructor
  //

  const SectionCard({
    super.key,
    required this.child,
    this.title,
    this.leading,
    this.color,
    this.onTap,
  });

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: color ?? theme.colorScheme.surfaceContainerLow,
      borderRadius: AppRadius.sm,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? theme.colorScheme.surfaceContainerLow,
          borderRadius: AppRadius.sm,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.sm,
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.s6,
              bottom: AppSpacing.s16,
              right: AppSpacing.s12,
              left: AppSpacing.s12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null || leading != null)
                  Row(
                    spacing: AppSpacing.s4,
                    children: [
                      ?leading,
                      if (title != null)
                        Expanded(child: Label(title!, isVariant: true)),
                    ],
                  ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
