import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/features/todo/data/data_source/todo_remote_data_source.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/add_todo_list.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteSource todoRemoteSource;

  TodoRepositoryImpl({required this.todoRemoteSource});

  @override
  Future<DataResponse<List<Todo>>> fetchTodoList() async {
    return await todoRemoteSource.fetchTodoList();
  }

  @override
  Future<DataResponse<Todo>> addTodo(AddTodoParam param) async {
    return await todoRemoteSource.addTodo(
        title: param.title, description: param.description);
  }
}
