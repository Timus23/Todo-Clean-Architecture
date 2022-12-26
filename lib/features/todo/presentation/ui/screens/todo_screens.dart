import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/features/todo/data/data_source/todo_remote_data_source.dart';
import 'package:todo_clean_architecture/features/todo/presentation/cubit/fetch_todo_list_cubit.dart';
import 'package:todo_clean_architecture/features/todo/presentation/ui/widgets/todo_widgets.dart';
import 'package:todo_clean_architecture/injector.dart';

class TodoScreens extends StatelessWidget {
  const TodoScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTodoListCubit(
          todoRemoteSource: DI.instance<TodoRemoteSourceImpl>()),
      child: const TodoWidgets(),
    );
  }
}
