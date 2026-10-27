import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/theme/app_icon_size.dart';
import 'package:trading_management/core/widgets/feedback/loading/loading.dart';

@AppPreview(group: 'feedback/loading', size: Size(360, 200))
Widget loadingPreview() {
  var platform = TargetPlatform.android;

  return StatefulBuilder(
    builder: (context, setState) => Theme(
      data: Theme.of(context).copyWith(platform: platform),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            SegmentedButton<TargetPlatform>(
              segments: const [
                ButtonSegment(
                  value: TargetPlatform.android,
                  label: Text('Android'),
                ),
                ButtonSegment(
                  value: TargetPlatform.iOS,
                  label: Text('iOS'),
                ),
              ],
              selected: {platform},
              onSelectionChanged: (selection) {
                setState(() => platform = selection.first);
              },
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Loading(size: AppIconSize.sm),
                    Loading(size: AppIconSize.md),
                    Loading(size: AppIconSize.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
