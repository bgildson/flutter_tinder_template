import 'package:redux/redux.dart';

import 'package:flutter_tinder_template/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, LoadAppAction>(_setLoading),
  new TypedReducer<bool, LoadedAppAction>(_setLoading),
]);

bool _setLoading(bool state, action) {
  if (action.runtimeType == LoadAppAction) {
    return true;
  } else if (action.runtimeType == LoadedAppAction) {
    return false;
  }
  return state;
}
