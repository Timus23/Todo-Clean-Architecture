import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/core/cubit/common_state.dart';
import 'package:todo_clean_architecture/core/model/no_param.dart';
import 'package:todo_clean_architecture/features/todo/data/models/todo_model.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/fetch_todo_list.dart';
import 'package:todo_clean_architecture/features/todo/presentation/cubit/add_todo_list_cubit.dart';

class FetchTodoListCubit extends Cubit<CommonState> {
  final FetchTodoList fetchTodoList;
  final AddTodoListCubit addTodoListCubit;
  StreamSubscription? addToListStream;

  FetchTodoListCubit({
    required this.fetchTodoList,
    required this.addTodoListCubit,
  }) : super(CommonInitialState()) {
    addToListStream = addTodoListCubit.stream.listen((state) {
      if (state is CommonDataState<Todo>) {
        fetchData();
      }
    });
  }

  fetchData() async {
    emit(CommonLoadingState());
    final res = await fetchTodoList.call(NoParam());
    if (res.status && res.data != null) {
      emit(
        CommonDataFetchedState<TodoModel>(
          item: res.data!
              .map((e) => TodoModel(title: e.title, description: e.description))
              .toList(),
        ),
      );
    } else {
      emit(CommonErrorState(message: res.message));
    }
  }
}
