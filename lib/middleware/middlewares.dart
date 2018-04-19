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
    TypedMiddleware<AppState, LoadStrangersAction>(_loadStrangers),
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
    .then((UserEntity data) {
      store.dispatch(new LoadMatchsAction());
      store.dispatch(new LoadStrangersAction());
      store.dispatch(new LoadUserSuccessAction(data));
    })
    .catchError((String message) =>
      store.dispatch(new LoadUserFailAction(message)));
}

void _loadMatchs(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  UsersService
    .loadMatchs()
    .then((List<UserEntity> data) =>
      store.dispatch(new LoadMatchsSuccessAction(data)))
    .catchError((String message) =>
      store.dispatch(new LoadMatchsFailAction(message)));
}

void _loadStrangers(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  UsersService
    .loadStrangers()
    .then((List<UserEntity> data) =>
      store.dispatch(new LoadStrangersSuccessAction(data)))
    .catchError((String message) =>
      store.dispatch(new LoadStrangersFailAction(message)));
}
