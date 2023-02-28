import 'package:flutter/material.dart';
import 'package:flutter_my_app/actions/actions.dart';
import 'package:flutter_my_app/models/app_state.dart';

import '../models/todo.dart';
import '../widgets/dialog_utils.dart';
import '../widgets/todo_list_view_provider.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ListViewContainer extends StatefulWidget {
  const ListViewContainer({super.key});

  @override
  _ListViewContainerState createState() => _ListViewContainerState();
}

class _ListViewContainerState extends State<ListViewContainer> {
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      // Connect to the store
      body: StoreConnector<AppState, bool>(
        converter: (Store<AppState> store) => store.state.reduxSetup,
        builder: (BuildContext context, bool reduxSetup) {
          debugPrint('reduxSetup: $reduxSetup');
          return TodoListViewProvider(list: _todos);
        },
      ),
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
      StoreProvider.of<AppState>(context).dispatch(TestAction(true));
      _todos.add(Todo(name: textFieldValue, checked: false));
    });
  }
}
