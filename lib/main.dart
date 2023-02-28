import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_my_app/models/app_state.dart';
import 'package:flutter_my_app/reducers/app_reducer.dart';
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

// void main() => runApp(const TodoApp());

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: const AppState(reduxSetup: true),
  );

  debugPrint('Initial state: ${store.state}');

  runApp(StoreProvider(store: store, child: const TodoApp()));
}
