import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model_state.dart';

import '../model/task.dart';

class TaskViewModel extends ChangeNotifier {
  var _taskState = TaskModelState();

  TaskModelState get taskState => _taskState;

  set taskState(TaskModelState value) {
    _taskState = _taskState.copyWith(tasks: value.tasks);

    notifyListeners();
  }

  void addTask(Task task) {
    var list = taskState.tasks.toList();

    if (list.any((t) => t.id == task.id)) {
      throw Error();
    } else {
      list.add(task);

      taskState = taskState.copyWith(tasks: list);
    }
  }

  void deleteTask(Task task) {
    var list = taskState.tasks.toList();

    list.removeWhere((t) => t.id == task.id);

    taskState = taskState.copyWith(tasks: list);
  }

  void toggleTask(Task task) {
    var list = taskState.tasks.toList();

    var index = list.indexWhere((t) => t.id == task.id);

    list[index] = task.copyWith(isDone: !task.isDone);

    taskState = taskState.copyWith(tasks: list);
  }
}
