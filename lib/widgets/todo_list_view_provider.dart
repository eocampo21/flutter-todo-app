import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/models.dart';
import '../redux/actions/todo_actions.dart';
import 'card_view.dart';
import 'dialog_utils.dart';

class TodoListViewProvider extends StatefulWidget {
  const TodoListViewProvider({super.key});

  @override
  _TodoListViewProviderState createState() => _TodoListViewProviderState();
}

class _TodoListViewProviderState extends State<TodoListViewProvider> {
  late List<Todo> _todos = [];

  _TodoListViewProviderState();

  void _onDeleteClicked(int val) {
    setState(() {
      _todos.removeAt(val);
    });
  }

  void _editTodoItem(String val, int index) {
    final store = StoreProvider.of<TodoState>(context);
    store.dispatch(EditTodoAction(newText: val, id: index));
  }

  Todo getElementAt(int index) => _todos.elementAt(index);

  void _onEditClicked(int index) {
    setState(() {
      // Get todo item to be edited
      final todoAt = getElementAt(index);

      DialogUtils().showCustomDialog(context,
          index: index,
          title: 'Edit Item',
          submitBttnText: "Ok",
          hintText: 'Type Todo name',
          inputValue: todoAt.name,
          submitBttnCallback: _editTodoItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, List<Todo>>(
      converter: (store) => store.state.todos,
      builder: (context, todos) {
        _todos = todos;
        return ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return CardView(
              title: _todos[index].name,
              index: index,
              onDeleteClicked: _onDeleteClicked,
              onEditClicked: _onEditClicked,
            );
          },
        );
      },
    );
  }
}
