import 'package:flutter/material.dart';

import '../models/todo.dart';
import 'card_view.dart';

class ListProviderView extends StatefulWidget {
  // Input
  final List<Todo> list;

  const ListProviderView({Key? key, required this.list}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ListViewState createState() => _ListViewState(list: list);
}

class _ListViewState extends State<ListProviderView> {
  late final List<Todo> list;

  _ListViewState({required this.list});

  void _onDeleteClicked(int val) {
    setState(() {
      list.removeAt(val);
    });
  }

  void _onEditClicked(int val) {
    setState(() {
      list = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
            list.length,
            (int index) => SafeArea(
                  child: Column(
                    children: [
                      CardView(
                        title: list[index].name,
                        index: index,
                        onDeleteClicked: _onDeleteClicked,
                        onEditClicked: _onEditClicked,
                      )
                    ],
                  ),
                )).toList());
  }
}
