import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_clean_architecture/features/todo/data/data_source/todo_remote_data_source.dart';
import 'package:todo_clean_architecture/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/fetch_todo_list.dart';

class DI {
  static final DI _di = DI._internal();

  DI._internal();

  factory DI() {
    return _di;
  }

  static final instance = GetIt.instance;

  static Future<void> init() async {
    //Network
    instance.registerSingleton(Dio());

    // use cases
    instance.registerLazySingleton(
      () => FetchTodoList(todoRepository: instance()),
    );

    //Repository
    instance.registerLazySingleton(
      () => TodoRepositoryImp(todoRemoteSource: instance()),
    );

    // Data Source

    instance.registerLazySingleton(
      () => TodoRemoteSourceImpl(
        dio: instance(),
      ),
    );
  }
}
