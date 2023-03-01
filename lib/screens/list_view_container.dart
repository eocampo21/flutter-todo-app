import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/actions/todo_actions.dart';
import '../models/models.dart';
import '../widgets/dialog_utils.dart';
import '../widgets/todo_list_view_provider.dart';

class ListViewContainer extends StatefulWidget {
  const ListViewContainer({super.key});

  @override
  _ListViewContainerState createState() => _ListViewContainerState();
}

class _ListViewContainerState extends State<ListViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      // Connect to the store
      body: StoreConnector<TodoState, List<Todo>>(
          converter: (Store<TodoState> store) => store.state.todos,
          builder: (BuildContext context, todos) {
            return const TodoListViewProvider();
          }),
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
      debugPrint('dispatch AddTodoAction $textFieldValue');
      StoreProvider.of<TodoState>(context).dispatch(
        AddTodoAction(text: textFieldValue),
      );
    });
  }
}
