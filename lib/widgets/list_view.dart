import 'package:flutter/material.dart';

import '../models/todo.dart';
import 'card_view.dart';

typedef ItemSelectedCallback = void Function(String);

class Listview extends StatelessWidget {
  /// Input
  final List<Todo> list;

  const Listview({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list.map((Todo todo) {
        return SafeArea(
          child: Column(
            children: [CardView(title: todo.name)],
          ),
        );
      }).toList(),
    );
  }
}
