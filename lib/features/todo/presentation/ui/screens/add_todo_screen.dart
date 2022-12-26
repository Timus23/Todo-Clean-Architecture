import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/features/todo/presentation/cubit/add_todo_list_cubit.dart';
import 'package:todo_clean_architecture/features/todo/presentation/ui/widgets/add_todo_widget.dart';
import 'package:todo_clean_architecture/injector.dart';

class AddTodoScreens extends StatelessWidget {
  const AddTodoScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DI.instance<AddTodoListCubit>(),
      child: const AddTodoWidget(),
    );
  }
}
