import 'package:redux/redux.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/utils/formatters.dart';

AppState stateSelector(Store<AppState> store) => store.state;

int mainInitialPageSelector(Store<AppState> store) =>
  stateSelector(store).mainInitialPage;

User userSelector(Store<AppState> store) => stateSelector(store).user;

String userPresentationNameSelector(Store<AppState> store) =>
  makePresentationName(stateSelector(store).user.user);

int userSelectedImageIndexSelector(Store<AppState> store) =>
  userSelector(store).selectedImageIndex;

List<String> userImagesSelector(Store<AppState> store) =>
  userSelector(store).user.images;

String userSelectedImageUrlSelector(Store<AppState> store) {
  List<String> images = userImagesSelector(store);
  if (images.length > 0)
    return images[userSelectedImageIndexSelector(store)];
  return '';
}

String userFirstImageUrlSelector(Store<AppState> store) {
  List<String> images = userImagesSelector(store);
  if (images.length > 0)
    return images[0];
  return '';
}

Matchs matchsSelector(Store<AppState> store) => stateSelector(store).matchs;

Strangers strangersSelector(Store<AppState> store) => stateSelector(store).strangers;

bool hasStrangersSelector(Store<AppState> store) => strangersSelector(store).strangers.length > 0;
