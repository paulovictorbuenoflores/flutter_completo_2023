import 'package:exemplo/TodoList/todo_list_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyHome());

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: TodoListPage(),
    );
  }
}
