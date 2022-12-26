import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/core/cubit/common_state.dart';
import 'package:todo_clean_architecture/features/todo/data/data_source/todo_remote_data_source.dart';
import 'package:todo_clean_architecture/features/todo/data/models/todo_model.dart';

class FetchTodoListCubit extends Cubit<CommonState> {
  final TodoRemoteSource todoRemoteSource;

  FetchTodoListCubit({required this.todoRemoteSource})
      : super(CommonInitialState());

  fetchTodoList() async {
    emit(CommonLoadingState());
    final res = await todoRemoteSource.fetchTodoList();
    if (res.status && res.data != null) {
      emit(CommonDataFetchedState<TodoModel>(item: res.data!));
    } else {
      emit(CommonErrorState(message: res.message));
    }
  }
}
