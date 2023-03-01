abstract class TodoAction {
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
  String get getText => text;
}
