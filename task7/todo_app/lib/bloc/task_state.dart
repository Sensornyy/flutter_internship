import 'package:equatable/equatable.dart';

import '../model/task.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

class TasksInitialState extends TasksState {}

class TasksLoadedState extends TasksState {
  const TasksLoadedState({required this.tasks});

  final List<Task> tasks;
  
  @override
  List<Object> get props => [tasks];
}

class TasksEditingState extends TasksState {
  const TasksEditingState({required this.tasksToEdit});

  final List<Task> tasksToEdit;

  @override
  List<Object> get props => [tasksToEdit];
}

class TasksErrorState extends TasksState {}