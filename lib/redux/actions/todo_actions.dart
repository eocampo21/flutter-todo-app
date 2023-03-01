abstract class TodoAction {
  get getText => null;

  @override
  String toString() {
    return '$runtimeType';
  }
}

class AddTodoAction extends TodoAction {
  static int _id = 0;
  final String text;

  AddTodoAction({required this.text}) {
    _id++;
  }

  int get id => _id;
  @override
  String get getText => text;
}

class EditTodoAction extends TodoAction {
  final int id;
  final String newText;

  EditTodoAction({required this.id, required this.newText});

  @override
  String get getText => newText;

  int get getId => id;
}

class DeleteTodoAction extends TodoAction {
  final int id;

  DeleteTodoAction({required this.id});

  int get getId => id;
}
