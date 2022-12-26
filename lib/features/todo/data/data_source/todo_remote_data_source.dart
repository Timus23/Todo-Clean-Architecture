import 'package:dio/dio.dart';
import 'package:todo_clean_architecture/core/model/data_response.dart';
import 'package:todo_clean_architecture/features/todo/data/models/todo_model.dart';

abstract class TodoRemoteSource {
  Future<DataResponse<List<TodoModel>>> fetchTodoList();
}

class TodoRemoteSourceImpl extends TodoRemoteSource {
  final Dio dio;

  TodoRemoteSourceImpl({required this.dio});

  @override
  Future<DataResponse<List<TodoModel>>> fetchTodoList() async {
    try {
      final res = await dio.get("http://127.0.0.1:3000/api/notes");
      final item = List.from(res.data["data"])
          .map((e) => TodoModel.fromJson(e))
          .toList();
      return DataResponse.success(item);
    } on DioError catch (e) {
      return DataResponse.error(e.message);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
