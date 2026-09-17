import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trading_management/core/theme/app_duration.dart';
import 'package:trading_management/core/theme/app_spacing.dart';
import 'package:trading_management/features/trade/data/trade/trade_search_conditions.dart';

/// 検索アプリバー
///
/// 取引をキーワードで検索するアプリバーを表示します。
///
/// - [onChanged] 検索条件変更時のコールバック
class TradeSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<TradeSearchConditions> onChanged;

  const TradeSearchAppBar({super.key, required this.onChanged});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<TradeSearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<TradeSearchAppBar> {
  /// コントローラー
  final _controller = TextEditingController();

  /// 待機時間
  Timer? _debounce;

  /// 入力中かどうか
  bool _isActive = false;

  /// テキスト変更イベント
  ///
  /// テキスト変更後、 300ms 待機してから検索処理を行います。
  ///
  /// - [keywords] 入力値
  void _onTextChanged(String keywords) {
    // タイマー破棄
    _debounce?.cancel();

    // 300ms 入力がなければ検索処理を行う。
    _debounce = Timer(AppDuration.slow, () {
      widget.onChanged(TradeSearchConditions(keywords: keywords));
    });
  }

  /// 検索バーアクティブ化
  ///
  /// 閉じるボタンを表示します。
  void _active() {
    if (_isActive) return;

    setState(() {
      _isActive = true;
    });
  }

  /// 検索バー非アクティブ化
  ///
  /// 閉じるボタンを非表示にし、キーワード検索を初期化します。
  void _deactivate() {
    _debounce?.cancel();
    _controller.clear();
    _debounce?.cancel(); // clear による onChanged の呼び出しを無効化

    FocusScope.of(context).unfocus();

    setState(() {
      _isActive = false;
    });

    widget.onChanged(const TradeSearchConditions(keywords: null));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: false, // 戻るボタン非表示
      scrolledUnderElevation: 0, // アプリバーの影なし
      surfaceTintColor: Colors.transparent,
      title: LayoutBuilder(
        builder: (context, constraints) {
          const closeButtonWidth = 54.0;

          return SizedBox(
            width: constraints.maxWidth,
            height: kToolbarHeight,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // テキストボックス
                AnimatedContainer(
                  duration: AppDuration.normal,
                  curve: Curves.easeInCubic,
                  width: _isActive
                      ? constraints.maxWidth - closeButtonWidth
                      : constraints.maxWidth,
                  child: SearchBar(
                    controller: _controller,
                    hintText: '取引を検索',
                    constraints: const BoxConstraints(
                      minHeight: 40,
                      maxHeight: 40,
                    ), // 高さ 40px 固定
                    textStyle: WidgetStatePropertyAll<TextStyle>(
                      theme.textTheme.labelLarge ?? TextStyle(fontSize: 14),
                    ),
                    hintStyle: WidgetStatePropertyAll<TextStyle>(
                      theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ) ??
                          TextStyle(fontSize: 14),
                    ),
                    leading: Icon(
                      Icons.search,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                    ),
                    onTap: _active,
                    onChanged: _onTextChanged,
                  ),
                ),
                // 閉じるボタン
                Positioned(
                  right: 0,
                  child: IgnorePointer(
                    ignoring: !_isActive,
                    child: AnimatedOpacity(
                      opacity: _isActive ? 1 : 0,
                      duration: AppDuration.normal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: AppSpacing.s6),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: _deactivate,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
