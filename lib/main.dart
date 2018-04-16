import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/containers/main_page.dart';
import 'package:flutter_tinder_template/containers/profile_details_page.dart';
import 'package:flutter_tinder_template/middleware/middlewares.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/reducers/app_state_reducer.dart';

class MyApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: createAllMiddlewares()
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Tinder Template',
        routes: {
          '/': (context) {
            return new StoreBuilder<AppState>(
              onInit: (store) {
                store.dispatch(new LoadUserAction());
              },
              builder: (context, store) {
                return new MainPage();
              }
            );
          },
          '/user-profile-details': (context) {
            return new StoreBuilder<AppState>(
              builder: (context, store) => new ProfileDetailsPage(),
            );
          }
        },
      ),
    );
  }
}

void main() => runApp(new MyApp());
