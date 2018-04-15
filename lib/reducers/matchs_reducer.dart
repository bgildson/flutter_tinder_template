import 'package:redux/redux.dart';

import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/models/models.dart';

final matchsReducer = combineReducers<Matchs>([
  new TypedReducer<Matchs, LoadMatchsAction>(_loadMatchs),
  new TypedReducer<Matchs, LoadMatchsSuccessAction>(_loadMatchsSuccess),
]);

Matchs _loadMatchs(Matchs state, LoadMatchsAction action) {
  return new Matchs.loading();
}

Matchs _loadMatchsSuccess(Matchs state, LoadMatchsSuccessAction action) {
  return new Matchs(
    isLoading: false,
    matchs: action.matchs,
  );
}
