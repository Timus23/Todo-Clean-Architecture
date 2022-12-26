import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:todo_clean_architecture/core/cubit/common_state.dart';
import 'package:todo_clean_architecture/core/widgets/custom_text_field.dart';
import 'package:todo_clean_architecture/features/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/features/todo/domain/usecases/add_todo_list.dart';
import 'package:todo_clean_architecture/features/todo/presentation/cubit/add_todo_list_cubit.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool _isLoading = false;

  void _updateState(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocListener<AddTodoListCubit, CommonState>(
          listener: (context, state) {
            if (state is CommonLoadingState) {
              _updateState(true);
            } else {
              _updateState(false);
            }

            if (state is CommonDataState<Todo>) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Note Saved Successfully"),
                ),
              );
              Navigator.of(context).pop();
            } else if (state is CommonErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: "Title",
                  controller: titleController,
                ),
                CustomTextField(
                  label: "Description",
                  controller: descriptionController,
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<AddTodoListCubit>().addTodo(
                          AddTodoParam(
                            title: titleController.text,
                            description: descriptionController.text,
                          ),
                        );
                  },
                  child: const Text("Save"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
