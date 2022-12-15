import 'task.dart';

class TaskModelState {
  final List<Task> tasks;

  TaskModelState({this.tasks = const <Task>[]});

  TaskModelState copyWith({
    List<Task>? tasks,
  }) {
    return TaskModelState(
      tasks: tasks ?? this.tasks,
    );
  }
}
