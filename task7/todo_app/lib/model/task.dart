import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id = DateTime.now().toString();
  final String title;
  final bool isDone;

  Task({
    required this.title,
    required this.isDone,
  });

  Task copyWith({
    String? title,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, title, isDone];
}
