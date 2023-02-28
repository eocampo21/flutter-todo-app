import '../models/app_state.dart';
import 'test_reducer.dart.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    reduxSetup: testReducer(state.reduxSetup, action),
  );
}
