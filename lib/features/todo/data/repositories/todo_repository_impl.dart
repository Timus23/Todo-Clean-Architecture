import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/features/todo/data/data_source/todo_remote_data_source.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImp extends TodoRepository {
  final TodoRemoteSource todoRemoteSource;

  TodoRepositoryImp({required this.todoRemoteSource});

  @override
  Future<DataResponse<List<Todo>>> fetchTodoList() async {
    return await todoRemoteSource.fetchTodoList();
  }
}
