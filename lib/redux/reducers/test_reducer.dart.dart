import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_my_app/actions/actions.dart';

final testReducer = TypedReducer<bool, TestAction>(_testActionReducer);

bool _testActionReducer(bool state, TestAction action) {
  return action.testPayload;
}
