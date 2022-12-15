import 'package:todo_app/model/status.dart';

class Task {
  final String id = DateTime.now() as String;
  final String title;
  final Status status;

  Task({
    required this.title,
    required this.status,
  });

  Task copyWith({
    String? title,
    Status? status,
  }) {
    return Task(
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }
}
