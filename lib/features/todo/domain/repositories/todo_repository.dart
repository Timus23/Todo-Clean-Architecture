import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/add_todo_list.dart';

abstract class TodoRepository {
  Future<DataResponse<List<Todo>>> fetchTodoList();

  Future<DataResponse<Todo>> addTodo(AddTodoParam param);
}
