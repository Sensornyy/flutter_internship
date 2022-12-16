import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_colors.dart';
import 'package:todo_app/widgets/create_task_drawer.dart';

import '../view_model/task_view_model.dart';
import '../widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<TaskViewModel>();

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text('Tasks', style: TextStyle(color: Colors.white))),
      endDrawer: CreateTaskDrawer(viewModel.addTask),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemBuilder: (_, int index) => TaskCard(
            task: viewModel.taskState.tasks[index],
            onDelete: viewModel.deleteTask,
            onToggle: viewModel.toggleTask,
          ),
          itemCount: viewModel.taskState.tasks.length,
        ),
      ),
    );
  }

  static Widget create() => ChangeNotifierProvider(
        create: (_) => TaskViewModel(),
        child: const TasksPage(),
      );
}
