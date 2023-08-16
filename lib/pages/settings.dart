import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/common_parts.dart';
import 'package:sample_sns/providers/common_parts.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void toFormPage(BuildContext context) {
    Navigator.of(context).pushNamed('/settings/change_username');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Column(
        children: [
          Card(
            child: TextButton(
              onPressed: () => toFormPage(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '名前を登録',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: isDarkMode ? Colors.white : Colors.black,
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              child: Row(children: [
                const Text('ダークモード'),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(isDarkModeProvider).setIsDarkMode();
                  },
                )
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
