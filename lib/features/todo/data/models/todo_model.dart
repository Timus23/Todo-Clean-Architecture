import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required super.title,
    required super.description,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json["title"],
      description: json["description"],
    );
  }
}
