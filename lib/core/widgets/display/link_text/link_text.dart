import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_message.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:url_launcher/url_launcher.dart';

/// リンク付きテキスト
///
/// - [text] テキスト
/// - [uri] URL
class LinkText extends StatelessWidget {
  //
  // fields
  //

  /// テキスト
  final String text;

  /// URI
  final String uri;

  //
  // constructor
  //

  const LinkText({super.key, required this.text, required this.uri});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoButton(
      padding: const EdgeInsets.all(AppSpacing.none),
      minimumSize: Size.zero,
      onPressed: _openLink,
      child: Text.rich(
        TextSpan(
          style: theme.textTheme.bodyMedium,
          children: [
            TextSpan(text: text),
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsetsGeometry.fromLTRB(
                  AppSpacing.s4,
                  AppSpacing.none,
                  AppSpacing.none,
                  AppSpacing.s2,
                ),
                child: Icon(
                  Icons.open_in_new,
                  size: AppIconSize.sm,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  // private methods
  //

  /// リンクオープン
  Future<void> _openLink() async {
    final url = Uri.parse(uri);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception(AppMessage.linkOpenFailed);
    }
  }
}
