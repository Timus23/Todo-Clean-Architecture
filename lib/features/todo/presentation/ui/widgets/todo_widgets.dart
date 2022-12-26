import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_architecture/core/cubit/common_state.dart';
import 'package:todo_clean_architecture/features/todo/data/models/todo_model.dart';
import 'package:todo_clean_architecture/features/todo/presentation/cubit/fetch_todo_list_cubit.dart';
import 'package:todo_clean_architecture/features/todo/presentation/ui/screens/add_todo_screen.dart';

class TodoWidgets extends StatefulWidget {
  const TodoWidgets({super.key});

  @override
  State<TodoWidgets> createState() => _TodoWidgetsState();
}

class _TodoWidgetsState extends State<TodoWidgets> {
  @override
  void initState() {
    super.initState();
    context.read<FetchTodoListCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddTodoScreens(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<FetchTodoListCubit, CommonState>(
        builder: (context, state) {
          if (state is CommonLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is CommonErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is CommonDataFetchedState<TodoModel>) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.item[index].title),
                  subtitle: Text(state.item[index].description),
                );
              },
              itemCount: state.item.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
