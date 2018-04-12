import 'package:flutter_tinder_template/models/models.dart';
import 'user_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    user: userReducer(state.user, action),
  );
}
