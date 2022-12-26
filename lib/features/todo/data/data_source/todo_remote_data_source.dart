import 'package:dio/dio.dart';
import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/features/todo/data/models/todo_model.dart';

abstract class TodoRemoteSource {
  Future<DataResponse<List<TodoModel>>> fetchTodoList();

  Future<DataResponse<TodoModel>> addTodo({
    required String title,
    required String description,
  });
}

class TodoRemoteSourceImpl implements TodoRemoteSource {
  final Dio dio;

  TodoRemoteSourceImpl({required this.dio});

  final List<TodoModel> _todos = [];

  @override
  Future<DataResponse<List<TodoModel>>> fetchTodoList() async {
    try {
      final res = await dio.get("http://127.0.0.1:3000/api/notes");
      final item = List.from(res.data["data"])
          .map((e) => TodoModel.fromJson(e))
          .toList();
      _todos.clear();
      _todos.addAll(item);
      return DataResponse.success(_todos);
    } on DioError catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }

  @override
  Future<DataResponse<TodoModel>> addTodo(
      {required String title, required String description}) async {
    try {
      final data = {"title": title, "description": description};
      final res = await dio.post("http://127.0.0.1:3000/api/notes", data: data);
      final item = TodoModel.fromJson(res.data["data"]);
      _todos.add(item);
      return DataResponse.success(item);
    } on DioError catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
