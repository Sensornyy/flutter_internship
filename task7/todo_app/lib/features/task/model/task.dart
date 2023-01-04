import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  @HiveField(0)
  final String user;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isDone;

  Task({
    required this.user,
    required this.title,
    required this.isDone,
  });

  Task copyWith({
    String? user,
    String? title,
    bool? isDone,
  }) {
    return Task(
      user: user ?? this.user,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
