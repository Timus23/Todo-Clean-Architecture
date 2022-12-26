import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<DataResponse<List<Todo>>> fetchTodoList();
}
