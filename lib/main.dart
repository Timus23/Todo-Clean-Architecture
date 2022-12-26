import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/features/todo/presentation/ui/screens/todo_screens.dart';
import 'package:todo_clean_architecture/injector.dart';

void main() async {
  await DI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoScreens(),
    );
  }
}

