import 'package:redux/redux.dart';

import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/models/models.dart';

final userReducer = combineReducers<User>([
  new TypedReducer<User, LoadUserAction>(_loadUser),
  new TypedReducer<User, LoadUserSuccessAction>(_loadUserSuccess),
  new TypedReducer<User, ChangeSelectedImageIndexAction>(_changeSelectedImageIndex),
]);

User _loadUser(User state, LoadUserAction action) {
  return new User.loading();
}

User _loadUserSuccess(User state, LoadUserSuccessAction action) {
  return new User(
    isLoading: false,
    user: action.user,
    selectedImageIndex: 0
  );
}

User _changeSelectedImageIndex(User state, ChangeSelectedImageIndexAction action) =>
  state.copyWith(selectedImageIndex: action.selectedImageIndex);
