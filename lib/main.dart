import 'package:flutter/material.dart';
import 'package:flutter_my_app/screens/list_view_container.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo list',
      home: ListViewContainer(),
    );
  }
}

void main() => runApp(const TodoApp());
