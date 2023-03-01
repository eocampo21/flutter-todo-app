import 'package:flutter/cupertino.dart';

import '../actions/todo_actions.dart';
import '../../models/models.dart';

List<Todo> todosReducer(List<Todo> state, TodoAction action) {
  if (action is AddTodoAction) {
    debugPrint('AddTodoAction $state');
    return <Todo>[
      ...state,
      Todo(name: action.getText, checked: false, key: action.id)
    ];
  }

  if (action is EditTodoAction) {
    debugPrint('EditTodoAction $state');
    return state.map((todo) {
      // This operation is O(n^2).
      var index = state.indexOf(todo);
      // See how it could be done in O(n)
      if (index == action.getId) {
        return Todo(
          name: action.getText,
          checked: todo.checked,
          key: action.id,
        );
      } else {
        return todo;
      }
    }).toList();
  }

  if (action is DeleteTodoAction) {
    debugPrint('DeleteTodoAction $state');
    return state.where((todo) => todo.key != action.getId).toList();
  }

  return state;
}

TodoState todoAppReducer(TodoState state, dynamic action) {
  return TodoState(todos: todosReducer(state.todos, action));
}
