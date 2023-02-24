import 'package:flutter/material.dart';
import 'package:flutter_my_app/screens/home.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo list',
      home: Home(),
    );
  }
}

void main() => runApp(const TodoApp());
