import 'package:redux/redux.dart';

import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/entities/entities.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/services/services.dart';

List<Middleware<AppState>> createAllMiddlewares() {
  return [
    TypedMiddleware<AppState, LoadAppAction>(_initalizeApp),
    TypedMiddleware<AppState, LoadUserAction>(_loadCurrentUser),
    TypedMiddleware<AppState, LoadMatchsAction>(_loadMatchs),
  ];
}

void _initalizeApp(Store<AppState> store, action, NextDispatcher next) {
  next(action);
  next(new LoadUserAction());
}

void _loadCurrentUser(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  UsersService
    .loadCurrentUser()
    .then((UserEntity user) {
      store.dispatch(new LoadUserSuccessAction(user));
      store.dispatch(new LoadMatchsAction());
    })
    .catchError((String message) =>
      store.dispatch(new LoadUserFailAction(message)));
}

void _loadMatchs(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  UsersService
    .loadMatchs()
    .then((List<UserEntity> matchs) =>
      store.dispatch(new LoadMatchsSuccessAction(matchs)))
    .catchError((String message) =>
      store.dispatch(new LoadMatchsFailAction(message)));
}
