import 'package:flutter/material.dart';
import 'package:trading_management/core/constants/app_message.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
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
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: _openLink,
        icon: const Icon(Icons.open_in_new, size: AppIconSize.sm),
        label: Text(text),
        iconAlignment: IconAlignment.end,
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
