import 'package:redux/redux.dart';

import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/entities/entities.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/services/services.dart';

List<Middleware<AppState>> createAllMiddlewares() {
  return [
    TypedMiddleware<AppState, LoadUserAction>(_loadCurrentUser),
  ];
}

void _loadCurrentUser(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  UsersService.loadCurrentUser()
    .then(
      (UserEntity user) =>
        store.dispatch(new LoadUserSuccessAction(user)))
    .catchError(
      (String message) =>
        store.dispatch(new LoadUserFailAction(message)));
}
