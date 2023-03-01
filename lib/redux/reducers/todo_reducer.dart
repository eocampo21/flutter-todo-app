import 'package:flutter/cupertino.dart';

import '../actions/todo_actions.dart';
import '../models/models.dart';

List<Todo> todosReducer(List<Todo> state, TodoAction action) {
  if (action is AddTodoAction) {
    debugPrint('todosReducer $state');
    return <Todo>[
      ...state,
      Todo(name: action.getText, checked: false, key: action.id)
    ];
  }

  return state;
}

TodoState todoAppReducer(TodoState state, dynamic action) {
  return TodoState(todos: todosReducer(state.todos, action));
}
