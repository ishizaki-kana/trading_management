import 'package:flutter/material.dart';

/// アプリ下部バー
///
/// 画面遷移を行う下部バーを表示します。
class AppBottomNavigationBar extends StatefulWidget {
  //
  // constructor
  //

  const AppBottomNavigationBar({super.key});

  //
  // public methods
  //

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  //
  // fields
  //

  /// 選択中のインデックス
  int _selectedIndex = 0;

  //
  // public methods
  //

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actions = [
      const NavigationDestination(icon: Icon(Icons.home), label: 'ホーム'),
      const NavigationDestination(icon: Icon(Icons.swap_horiz), label: '取引'),
      const NavigationDestination(icon: Icon(Icons.add), label: '登録'),
      const NavigationDestination(icon: Icon(Icons.list), label: '在庫'),
      const NavigationDestination(icon: Icon(Icons.settings), label: '設定'),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
      ),
      child: NavigationBar(
        backgroundColor: theme.colorScheme.surfaceContainerLow,
        elevation: 8,
        height: 64,
        selectedIndex: _selectedIndex,
        destinations: actions,
        onDestinationSelected: navigation,
      ),
    );
  }

  //
  // private methods
  //

  /// 画面遷移
  ///
  /// - [index] 画面遷移するメニューのインデックス
  void navigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
