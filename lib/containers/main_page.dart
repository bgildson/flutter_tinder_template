import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tinder_template/containers/profile_page.dart';
import 'package:flutter_tinder_template/containers/search_page.dart';
import 'package:flutter_tinder_template/containers/chat_page.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/presentation/paged_screen.dart';
import 'package:flutter_tinder_template/selectors/selectors.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return new PagedScreen(
          controller: vm.controller,
          indicators: [
            Icons.person,
            Icons.whatshot,
            Icons.message,
          ],
          pages: <Widget>[
            new ProfilePage(),
            new SearchPage(),
            new ChatPage(),
          ],
        );
      },
    );
  }
}

class ViewModel {
  ViewModel(int initialPage)
    : controller = new PageController(initialPage: initialPage);

  // TODO: create initialPage state for future necessity of the
  // store change/store the currentPage
  static ViewModel fromStore(Store<AppState> store) =>
    new ViewModel(mainInitialPageSelector(store));

  final PageController controller;
}
