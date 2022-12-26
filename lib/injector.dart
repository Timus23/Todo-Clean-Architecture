import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_clean_architecture/features/todo/data/data_source/todo_remote_data_source.dart';
import 'package:todo_clean_architecture/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_clean_architecture/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/add_todo_list.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/fetch_todo_list.dart';
import 'package:todo_clean_architecture/features/todo/presentation/cubit/add_todo_list_cubit.dart';

class DI {
  static final DI _di = DI._internal();

  DI._internal();

  factory DI() {
    return _di;
  }

  static final instance = GetIt.instance;

  static Future<void> init() async {
    // Bloc
    instance.registerLazySingleton<AddTodoListCubit>(
        () => AddTodoListCubit(addTodoList: instance()));

    //Network
    instance.registerSingleton(Dio());

    // use cases
    instance.registerLazySingleton(
      () => FetchTodoList(todoRepository: instance()),
    );

    instance.registerLazySingleton(
      () => AddTodoList(todoRepository: instance()),
    );

    //Repository
    instance.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(todoRemoteSource: instance()),
    );

    // Data Source

    instance.registerLazySingleton<TodoRemoteSource>(
      () => TodoRemoteSourceImpl(
        dio: instance(),
      ),
    );
  }
}
