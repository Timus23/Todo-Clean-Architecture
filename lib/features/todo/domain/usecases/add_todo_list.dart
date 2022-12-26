import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/core/usecases/usecase.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/repositories/todo_repository.dart';

class AddTodoList implements UseCase<Todo, AddTodoParam> {
  final TodoRepository todoRepository;

  AddTodoList({required this.todoRepository});

  @override
  Future<DataResponse<Todo>> call(AddTodoParam param) async {
    return await todoRepository.addTodo(param);
  }
}

class AddTodoParam {
  final String title;
  final String description;

  AddTodoParam({
    required this.title,
    required this.description,
  });
}
