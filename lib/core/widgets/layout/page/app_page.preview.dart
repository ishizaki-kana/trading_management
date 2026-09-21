import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/widgets/layout/page/app_page.dart';
import 'package:trading_management/core/widgets/navigation/app_bars/common/common_app_bar.dart';

const _group = 'layout/page';

@AppPreview(group: _group, name: 'Default', size: Size(360, 640))
Widget appPagePreview() {
  return const AppPage(
    appBar: CommonAppBar(title: 'ページタイトル'),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [Text('ページコンテンツ'), Text('スクロール可能なコンテンツを表示します。')],
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

@AppPreview(group: _group, name: 'Error', size: Size(360, 640))
Widget appPageErrorPreview() {
  return const AppPage(
    appBar: CommonAppBar(title: 'ページタイトル'),
    message: 'データの読み込みに失敗しました。',
    body: SizedBox(),
  );
}
