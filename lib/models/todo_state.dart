import 'package:meta/meta.dart';
import 'package:flutter_my_app/models/todo.dart';

@immutable
class TodoState {
  final List<Todo> todos;

  const TodoState({
    required this.todos,
  });

  @override
  String toString() {
    return 'AppState: {todos: $todos}';
  }

  factory TodoState.initialState() {
    return const TodoState(todos: []);
  }
}
