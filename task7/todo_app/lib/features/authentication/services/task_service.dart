import 'package:hive/hive.dart';

import '../../task/model/task.dart';

class TaskService {
  late Box<Task> _tasks;

  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>('tasksBox');
  }

  List<Task>getTasks(String username) {
    final tasks =_tasks.values.where((task) => task.user == username);

    return tasks.toList();
  }

  void addTask(String username, String title) {
    _tasks.add(Task(user: username, title: title, isDone: false));
  }

  Future<void> removeTask(String username, String title) async {
      final taskToRemove = _tasks.values.firstWhere((task) => task.title == title && task.user == username);

      await taskToRemove.delete();           
  }

  Future<void> toggleTask(String username, String title) async {
    final taskToEdit = _tasks.values.firstWhere((task) => task.title == title && task.user == username);

    final index = taskToEdit.key as int;

    await _tasks.put(index, taskToEdit.copyWith(isDone: !taskToEdit.isDone));
  }

}