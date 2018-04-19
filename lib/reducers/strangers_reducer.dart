import 'package:redux/redux.dart';
import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/models/models.dart';

final strangersReducer = combineReducers<Strangers>([
  new TypedReducer<Strangers, LoadStrangersAction>(_loadStrangersReducer),
  new TypedReducer<Strangers, LoadStrangersSuccessAction>(_loadStrangersSuccessReducer),
]);

Strangers _loadStrangersReducer(Strangers state, LoadStrangersAction action) =>
  new Strangers.loading();

Strangers _loadStrangersSuccessReducer(Strangers state, LoadStrangersSuccessAction action) {
  return new Strangers(
    isLoading: false,
    strangers: action.strangers,
  );
}
