import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

import '../widgets/task_card.dart';

class TasksPage extends StatefulWidget {
  TasksPage(this._tasks, this.deleteTask, {Key? key}) : super(key: key);

  late final List<Task> _tasks;
  final Function deleteTask;

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return widget._tasks.isEmpty
        ? const Center(
            child: Text(
              'Nothing to show yet',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: widget._tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(widget._tasks[index]),
                onDismissed: (DismissDirection direction) {
                  widget.deleteTask(widget._tasks[index].id);
                },
                child: TaskCard(widget._tasks[index]),
              );
            },
          );
  }
}
