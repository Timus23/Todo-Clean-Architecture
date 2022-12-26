import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/core/model/no_param.dart';
import 'package:todo_clean_architecture/core/usecases/usecase.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/repositories/todo_repository.dart';

class FetchTodoList extends UseCase<List<Todo>, NoParam> {
  final TodoRepository todoRepository;

  FetchTodoList({required this.todoRepository});

  @override
  Future<DataResponse<List<Todo>>> call(NoParam param) async {
    return await todoRepository.fetchTodoList();
  }
}
