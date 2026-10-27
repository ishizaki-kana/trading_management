import 'package:flutter/material.dart';
import 'package:trading_management/core/preview/app_preview.dart';
import 'package:trading_management/core/types/app_feedback.dart';
import 'package:trading_management/core/widgets/feedback/banner/status_banner.dart';

const _group = 'feedback/banner/status';

@AppPreview(group: _group, name: 'Success', size: Size(360, 160))
Widget statusBannerSuccessPreview() {
  return _buildPreview(
    const StatusBanner(type: AppFeedback.success, message: '取引を登録しました。'),
  );
}

@AppPreview(group: _group, name: 'Info', size: Size(360, 160))
Widget statusBannerInfoPreview() {
  return _buildPreview(
    const StatusBanner(type: AppFeedback.info, message: '入力内容を保存できます。'),
  );
}

@AppPreview(group: _group, name: 'Warning', size: Size(360, 160))
Widget statusBannerWarningPreview() {
  return _buildPreview(
    const StatusBanner(type: AppFeedback.warning, message: '入力内容を確認してください。'),
  );
}

@AppPreview(group: _group, name: 'Error', size: Size(360, 160))
Widget statusBannerErrorPreview() {
  return _buildPreview(
    const StatusBanner(type: AppFeedback.error, message: '取引の登録に失敗しました。'),
  );
}

Widget _buildPreview(StatusBanner banner) {
  return Scaffold(
    body: Padding(padding: const EdgeInsets.all(16), child: banner),
  );
}
