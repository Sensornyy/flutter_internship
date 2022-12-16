class Task {
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
}
