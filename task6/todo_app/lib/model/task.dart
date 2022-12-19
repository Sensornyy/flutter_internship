class Task {
  final String id = DateTime.now().toString();
  final String title;
  final bool isDone;
  final bool isEdit;

  Task({
    required this.title,
    required this.isDone,
    required this.isEdit,
  });

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isEdit,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isEdit: isEdit ?? this.isEdit,
    );
  }
}
