import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/bloc/task_state.dart';

import '../model/task.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitialState());

  void start() {
    emit(TasksLoadedState(tasks: []));
  }

  void addTask(Task task) {
    var tasksState = state;
    log(tasksState.runtimeType.toString());
    
    if (tasksState is TasksLoadedState) {
      var tasks = tasksState.tasks;
log(tasksState.runtimeType.toString());
      tasks.add(task);

      emit(TasksLoadedState(tasks: tasks));
    } else {
      log(tasksState.runtimeType.toString());
      emit(TasksErrorState());
    }
  }

  void deleteTask(Task task) {
    var tasksState = state;

    if (tasksState is TasksLoadedState) {
      var tasks = tasksState.tasks;

      tasks.removeWhere((t) => t.id == task.id);

      emit(TasksLoadedState(tasks: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void toggleTask(Task task) {
    var tasksState = state;

    if (tasksState is TasksLoadedState) {
      var tasks = tasksState.tasks;

      var index = tasks.indexWhere((t) => t.id == task.id);

      tasks[index] = task.copyWith(isDone: !task.isDone);

      emit(TasksLoadedState(tasks: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void editTask(Task task) {
    var tasksState = state;

    if (tasksState is TasksEditingState) {
      var tasksToEdit = tasksState.tasksToEdit;

      var index = tasksToEdit.indexWhere((t) => t.id == task.id);

      tasksToEdit[index] = task.copyWith(isDone: true);

      for (var i = 0; i < tasksToEdit.length; i++) {
        tasksToEdit[i] = tasksToEdit[i].copyWith(isEdit: true);
      }

      emit(TasksEditingState(tasksToEdit: tasksToEdit));
    } else {
      emit(TasksErrorState());
    }
  }

  void cancelEditingTask() {
    var tasksState = state;

    if (tasksState is TasksEditingState) {
      var tasks = tasksState.tasksToEdit;

      for (var i = 0; i < tasks.length; i++) {
        tasks[i] = tasks[i].copyWith(isEdit: false);
      }

      emit(TasksLoadedState(tasks: tasks));
    } else {
      emit(TasksErrorState());
    }
  }
}
