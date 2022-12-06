import 'package:flutter/material.dart';
import 'package:todo_app/pages/tasks_page.dart';

import '../widgets/custom_tab_bar.dart';
import 'custom_tab_bar_view.dart';
import '../common/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<Widget> _pages = <Widget>[
    TasksPage(),
    Icon(Icons.calendar_month_outlined, size: 150),
    Icon(Icons.sticky_note_2_outlined, size: 150),
    Icon(Icons.person_outline, size: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            actions: const <Widget>[Icon(Icons.notes_sharp)],
            title:
                const Text('Lessons', style: TextStyle(color: Colors.white))),
        body: const Center(
          child: CustomTabBarView(pages: _pages),
        ),
        bottomNavigationBar: const ColoredBox(
            color: AppColors.tabBarColor, child: CustomTabBar()),
      ),
    );
  }
}
