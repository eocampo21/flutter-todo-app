import 'package:flutter/material.dart';

import '../models/todo.dart';
import 'card_view.dart';
import 'dialog_utils.dart';

class TodoListViewProvider extends StatefulWidget {
  // Input
  final List<Todo> list;

  const TodoListViewProvider({Key? key, required this.list}) : super(key: key);

  @override
  _TodoListViewProviderState createState() =>
      // ignore: no_logic_in_create_state
      _TodoListViewProviderState(list: list);
}

class _TodoListViewProviderState extends State<TodoListViewProvider> {
  late final List<Todo> list;

  _TodoListViewProviderState({required this.list});

  void _onDeleteClicked(int val) {
    setState(() {
      list.removeAt(val);
    });
  }

  void _editTodoItem(String val, int index) {
    setState(() {
      list[index].name = val;
    });
  }

  Todo getElementAt(int index) => list.elementAt(index);

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
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return CardView(
            title: list[index].name,
            index: index,
            onDeleteClicked: _onDeleteClicked,
            onEditClicked: _onEditClicked,
          );
        });
  }
}
