import 'package:todo_clean_architecture/core/model/data_response.dart';

abstract class UseCase<Type, Param> {
  Future<DataResponse<Type>> call(Param param);
}
