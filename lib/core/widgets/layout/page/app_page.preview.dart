import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/common/common_app_bar.dart';

const _group = 'layout/page';

@AppPreview(group: _group, name: 'Default', size: Size(360, 640))
Widget appPagePreview() {
  return const AppPage(
    appBar: CommonAppBar(title: 'ページタイトル'),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [Text('ページコンテンツ'), Text('スクロール可能なコンテンツを表示します。')],
      ),
    ),
  );
}

@AppPreview(group: _group, name: 'Loading', size: Size(360, 640))
Widget appPageLoadingPreview() {
  return const AppPage(
    appBar: CommonAppBar(title: 'ページタイトル'),
    isLoading: true,
    body: SizedBox(),
  );
}

@AppPreview(group: _group, name: 'Message', size: Size(360, 640))
Widget appPageMessagePreview() {
  return const AppPage(
    appBar: CommonAppBar(title: 'ページタイトル'),
    message: 'データを読み込みました。',
    body: SizedBox(),
  );
}

@AppPreview(group: _group, name: 'With bottom navigation', size: Size(360, 640))
Widget appPageWithBottomNavigationPreview() {
  return const AppPage(
    appBar: CommonAppBar(title: 'ページタイトル'),
    body: Padding(padding: EdgeInsets.all(16), child: Text('ページコンテンツ')),
    bottomNavigationBar: AppBottomNavigationBar(),
  );
}
