import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/core/cubit/common_state.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/add_todo_list.dart';

class AddTodoListCubit extends Cubit<CommonState> {
  final AddTodoList addTodoList;
  AddTodoListCubit({required this.addTodoList}) : super(CommonInitialState());

  addTodo(AddTodoParam param) async {
    emit(CommonLoadingState());
    final res = await addTodoList.call(param);
    if (res.status && res.data != null) {
      emit(CommonDataState<Todo>(item: res.data!));
    } else {
      emit(CommonErrorState(message: res.message));
    }
  }
}
