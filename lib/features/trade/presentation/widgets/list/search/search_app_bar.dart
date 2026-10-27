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
  //
  // fields
  //

  /// 検索条件変更時のコールバック
  final ValueChanged<TradeSearchConditions> onChanged;

  //
  // constructor
  //

  const TradeSearchAppBar({super.key, required this.onChanged});

  //
  // getter
  //

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  //
  // public methods
  //

  @override
  State<TradeSearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<TradeSearchAppBar> {
  //
  // fields
  //

  /// コントローラー
  final _controller = TextEditingController();

  /// 待機時間
  Timer? _debounce;

  /// 入力中かどうか
  bool _isActive = false;

  //
  // public methods
  //

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
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      title: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: kToolbarHeight,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                _buildTextBox(theme, constraints),
                _buildCloseButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  //
  // private methods
  //

  /// テキストボックス作成
  ///
  /// - [theme] テーマ
  /// - [constraints] レイアウト制約
  Widget _buildTextBox(ThemeData theme, BoxConstraints constraints) {
    // 閉じるボタンのサイズ
    const closeButtonWidth = 54.0;

    // テキストボックスのサイズ
    final double width = _isActive
        ? (constraints.maxWidth - closeButtonWidth)
              .clamp(0.0, constraints.maxWidth)
              .toDouble()
        : constraints.maxWidth;

    // テキストスタイル
    final textStyle =
        theme.textTheme.labelLarge ?? const TextStyle(fontSize: 14);

    return AnimatedContainer(
      duration: AppDuration.normal,
      curve: Curves.easeInCubic,
      width: width,
      height: constraints.maxHeight,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s8),
      child: SearchBar(
        controller: _controller,
        hintText: '取引を検索',
        leading: Icon(Icons.search, color: theme.colorScheme.onSurfaceVariant),
        textStyle: WidgetStatePropertyAll<TextStyle>(textStyle),
        hintStyle: WidgetStatePropertyAll<TextStyle>(
          textStyle.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: AppSpacing.s16),
        ),
        onTap: _active,
        onChanged: _onTextChanged,
      ),
    );
  }

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

  /// 閉じるボタン作成
  Widget _buildCloseButton() {
    return Positioned(
      right: 0,
      child: ExcludeSemantics(
        excluding: !_isActive, // 非アクティブ時はアクセシビリティ機能から除外
        child: IgnorePointer(
          ignoring: !_isActive, // 非アクティブ時は操作無効
          child: AnimatedOpacity(
            opacity: _isActive ? 1 : 0, // 非アクティブ時は非表示
            duration: AppDuration.normal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: AppSpacing.s6),
                CloseButton(onPressed: _deactivate),
              ],
            ),
          ),
        ),
      ),
    );
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
}
