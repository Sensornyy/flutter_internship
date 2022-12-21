import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/bloc/task_state.dart';

import '../model/task.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitialState());

  void addTask(Task task) {
    var tasksState = state;

    if (tasksState is TasksLoadedState) {
      var tasks = tasksState.tasks;

      tasks.add(task);

      emit(TasksLoadedState(tasks: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void deleteTask(Task task) {
    try {
      tasks.removeWhere((t) => t.id == task.id);
    } catch (e) {
      emit(TasksErrorState());
    }
  }

  void toggleTask(Task task) {
    try {
      var index = tasks.indexWhere((t) => t.id == task.id);
      tasks[index] = task.copyWith(isDone: !task.isDone);
    } catch (e) {}
  }
}
