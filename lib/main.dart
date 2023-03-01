import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_my_app/screens/list_view_container.dart';

import 'models/models.dart';
import 'redux/reducers/todo_reducer.dart';

// Used to testing out
Todo todo = Todo(name: 'First task', checked: false, key: 1);
Todo secondTodo = Todo(name: 'Second task', checked: false, key: 2);

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

void main() {
  // Create the store
  final store = Store<TodoState>(
    todoAppReducer,
    // initialState: TodoState.initialState(),
    // Initialize with some examples
    initialState: TodoState(todos: [todo, secondTodo]),
  );

  debugPrint('Initial state: ${store.state}');
  // Provide the store to the application
  runApp(StoreProvider<TodoState>(store: store, child: const TodoApp()));
}
