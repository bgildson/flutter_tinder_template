import 'package:redux/redux.dart';

import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/models/models.dart';

final userReducer = combineReducers<User>([
  new TypedReducer<User, LoadUserAction>(_loadUser),
  new TypedReducer<User, LoadUserSuccessAction>(_loadUserSuccess),
]);

User _loadUser(User state, LoadUserAction action) {
  return new User.loading();
}

User _loadUserSuccess(User state, LoadUserSuccessAction action) {
  return new User(
    isLoading: false,
    user: action.user,
    selectedImageUrl: action.user.images[0]
  );
}
