import 'package:flutter/material.dart';
import 'package:trading_management/core/presentation/error/app_message_mapper.dart';
import 'package:trading_management/core/types/app_display_message.dart';
import 'package:trading_management/core/types/message_type/app_feedback_type.dart';
import 'package:trading_management/core/types/message_type/app_status_type.dart';

class AppForm extends StatelessWidget {
  //
  // fields
  //

  //
  // constructor
  //

  const AppForm({super.key});

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

abstract class AppFormState<T extends StatefulWidget> extends State<T> {
  //
  // fields
  //

  /// フォームキー
  final formKey = GlobalKey<FormState>();

  /// メッセージ
  AppDisplayMessage? displayMessage;

  /// 登録中かどうか
  bool isSaving = false;

  //
  // getter
  //

  /// バリデーションエラーが発生しているかどうか
  bool get isValidationError =>
      displayMessage != null && displayMessage!.type == AppFeedbackType.warning;

  /// フォームエラーが発生しているかどうか
  bool get isFormError =>
      displayMessage != null &&
      (displayMessage!.type == AppFeedbackType.error ||
          displayMessage!.type == AppStatusType.notfound);

  //
  // public methods
  //

  /// 登録
  ///
  /// - [action] 実行する処理
  Future<void> save<R>({required Future<R> Function() action}) async {
    FocusScope.of(context).unfocus();

    final formState = formKey.currentState;
    if (formState == null) return;

    // ローディング状態・画面メッセージ初期化
    setState(() {
      isSaving = true;
      displayMessage = null;
    });

    if (!formState.validate()) return; // バリデーション

    formState.save(); // 各フィールドの onSaved を実行

    try {
      await action(); // 処理実行

      if (!mounted) return;
      Navigator.of(context).pop(true); // 呼び出し元に更新成功を伝える
    } catch (e) {
      if (!mounted) return;

      setState(() {
        displayMessage = AppMessageMapper.fromError(e);
      });
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }
}
