class TodoItemModel {
  final int id;
  final String title;
  final String description;
  final bool isDone;

  TodoItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  TodoItemModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return TodoItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
