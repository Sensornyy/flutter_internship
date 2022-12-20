import 'package:flutter/material.dart';
import 'package:todo_app/pages/tasks_page.dart';

import '../widgets/custom_tab_bar.dart';
import 'custom_tab_bar_view.dart';
import '../common/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _pages = <Widget>[
    Icon(Icons.calendar_month_outlined, size: 150),
    Icon(Icons.sticky_note_2_outlined, size: 150),
    Icon(Icons.person_outline, size: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length + 1,
      child: Scaffold(
        body: Center(
          child: CustomTabBarView(TasksPage.create(), pages: _pages),
        ),
        bottomNavigationBar: const ColoredBox(
          color: AppColors.tabBarColor,
          child: CustomTabBar(),
        ),
      ),
    );
  }
}
