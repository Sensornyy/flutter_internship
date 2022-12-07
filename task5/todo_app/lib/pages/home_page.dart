import 'package:flutter/material.dart';
import 'package:todo_app/pages/tasks_page.dart';
import 'package:todo_app/widgets/create_task_drawer.dart';

import '../widgets/custom_tab_bar.dart';
import 'custom_tab_bar_view.dart';
import '../common/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<Widget> _pages = <Widget>[
    TasksPage(),
    Icon(Icons.calendar_month_outlined, size: 150),
    Icon(Icons.sticky_note_2_outlined, size: 150),
    Icon(Icons.person_outline, size: 150),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: HomePage._pages.length,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.mainBackground,
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const SafeArea(
            child: CreateTaskDrawer(),
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            //actions: <Widget>[IconButton(icon:Icon(Icons.notes_sharp), onPressed: () {})],
            title:
                const Text('Lessons', style: TextStyle(color: Colors.white))),
        body: const Center(
          child: CustomTabBarView(pages: HomePage._pages),
        ),
        bottomNavigationBar: const ColoredBox(
            color: AppColors.tabBarColor, child: CustomTabBar()),
      ),
    );
  }
}
