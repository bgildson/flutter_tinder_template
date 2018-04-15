import 'package:redux/redux.dart';
import 'package:flutter_tinder_template/models/models.dart';

AppState stateSelector(Store<AppState> store) => store.state;

int mainInitialPageSelector(Store<AppState> store) =>
  stateSelector(store).mainInitialPage;

User userSelector(Store<AppState> store) => stateSelector(store).user;

String userSelectedImageUrlSelector(Store<AppState> store) =>
  userSelector(store).selectedImageUrl;

Matchs matchsSelector(Store<AppState> store) => stateSelector(store).matchs;
