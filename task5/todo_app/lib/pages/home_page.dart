import 'package:flutter/material.dart';
import 'package:todo_app/pages/tasks_page.dart';
import 'package:todo_app/widgets/create_task_drawer.dart';

import '../model/status.dart';
import '../model/task.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length + 1,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.mainBackground,
        endDrawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SafeArea(
            child: CreateTaskDrawer(_addTask),
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            //actions: <Widget>[IconButton(icon:Icon(Icons.notes_sharp), onPressed: () {})],
            title:
                const Text('Lessons', style: TextStyle(color: Colors.white))),
        body: Center(
          child:
              CustomTabBarView(TasksPage(_tasks, _deleteTask), pages: _pages),
        ),
        bottomNavigationBar: const ColoredBox(
            color: AppColors.tabBarColor, child: CustomTabBar()),
      ),
    );
  }

  void _addTask(
    String taskTitle,
    Icon taskIcon,
    String taskStatus,
  ) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: taskTitle,
      icon: taskIcon,
      status: taskStatus,
    );

    setState(() {
      _tasks.add(newTask);
    });
  }

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((tx) => tx.id == id);
    });
  }
}
