import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/task_state.dart';

import '../model/task.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitialState());

  void start() {
    emit(const TasksLoadedState(tasks: []));
  }

  void addTask(Task task) {
    final tasksState = state;
    final List<Task> tasks;

    if (tasksState is TasksEditingState) {
      tasks = List.from(tasksState.tasksToEdit)..add(task);

      emit(TasksLoadedState(tasks: tasks));
    } else if (tasksState is TasksLoadedState) {
      tasks = List.from(tasksState.tasks)..add(task);

      emit(TasksLoadedState(tasks: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void deleteTask(Task task) {
    final tasksState = state;
    final List<Task> tasks;

    if (tasksState is TasksLoadedState) {
      tasks = List.from(tasksState.tasks)..removeWhere((t) => t.id == task.id);

      emit(TasksLoadedState(tasks: tasks));
    } else if (tasksState is TasksEditingState) {
      tasks = List.from(tasksState.tasksToEdit)
        ..removeWhere((t) => t.id == task.id);

      emit(TasksEditingState(tasksToEdit: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void toggleTask(Task task) {
    final tasksState = state;
    final List<Task> tasks;

    if (tasksState is TasksEditingState) {
      final index = tasksState.tasksToEdit.indexOf(task);

      tasks = List.from(tasksState.tasksToEdit)
        ..removeWhere((t) => t.id == task.id);

      tasks.insert(index, task.copyWith(isDone: !task.isDone));

      emit(TasksEditingState(tasksToEdit: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void editTask(Task task) {
    final tasksState = state;
    final List<Task> tasks;

    if (tasksState is TasksLoadedState) {
      final index = tasksState.tasks.indexOf(task);

      tasks = List.from(tasksState.tasks)..removeWhere((t) => t.id == task.id);

      tasks.insert(index, task.copyWith(isDone: !task.isDone));

      emit(TasksEditingState(tasksToEdit: tasks));
    } else {
      emit(TasksErrorState());
    }
  }

  void cancelEditingTask() {
    final tasksState = state;
    final List<Task> tasks;

    if (tasksState is TasksEditingState) {
      tasks = tasksState.tasksToEdit;

      emit(TasksLoadedState(tasks: tasks));
    } else {
      emit(TasksErrorState());
    }
  }
}