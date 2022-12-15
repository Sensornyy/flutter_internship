import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model_state.dart';

class TaskViewModel extends ChangeNotifier {
  var _taskState = TaskModelState();

  TaskModelState get taskState => _taskState;

  set taskState(TaskModelState value) {
    _taskState = _taskState.copyWith(tasks: value.tasks);

    notifyListeners();
  }
}
