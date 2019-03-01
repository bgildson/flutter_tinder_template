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

void _loadCurrentUser(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  try {
    UserEntity user =  await UsersService.loadCurrentUser();

    store.dispatch(new LoadMatchsAction());
    store.dispatch(new LoadStrangersAction());
    store.dispatch(new LoadUserSuccessAction(user));
  } catch (error) {
    store.dispatch(new LoadUserFailAction(error.message));
  }
}

void _loadMatchs(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  try {
    List<UserEntity> users = await UsersService.loadMatchs();

    store.dispatch(new LoadMatchsSuccessAction(users));
  } catch (error) {
    store.dispatch(new LoadMatchsFailAction(error.message));
  }
}

void _loadStrangers(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  try {
    List<UserEntity> users = await UsersService.loadStrangers();

    store.dispatch(new LoadStrangersSuccessAction(users));
  } catch (error) {
    store.dispatch(new LoadStrangersFailAction(error.message));
  }
}
