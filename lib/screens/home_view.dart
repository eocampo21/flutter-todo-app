import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../widgets/dialog_utils.dart';
import '../widgets/list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: ListProviderView(list: _todos),
      floatingActionButton: FloatingActionButton(
          onPressed: () => DialogUtils().showCustomDialog(context,
              title: 'Add new Item',
              submitBttnText: "Ok",
              hintText: 'Type Todo name',
              submitBttnCallback: _addTodoItem),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }

  void _addTodoItem(String textFieldValue, int index) {
    setState(() {
      _todos.add(Todo(name: textFieldValue, checked: false));
    });
  }
}
