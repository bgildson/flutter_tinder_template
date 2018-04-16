import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tinder_template/actions/actions.dart';
import 'package:flutter_tinder_template/entities/entities.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/presentation/image_carousel.dart';
import 'package:flutter_tinder_template/presentation/rounded_button_icon.dart';
import 'package:flutter_tinder_template/selectors/selectors.dart';
import 'package:flutter_tinder_template/utils/formatters.dart';

class ProfileDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        final double backButtonIconSize = MediaQuery.of(context).size.width / 10;
        return new Scaffold(
          body: new Stack(
            children: <Widget>[
              new ListView(
                padding: new EdgeInsets.all(0.0),
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ImageCarousel(
                            images: vm.user.images,
                            currentImageIndex: vm.selectedImageIndex,
                            tagBase: 'user-profile-image-',
                            onCurrentImageIndexChanged: vm.onCurrentImageIndexChanged,
                          ),
                          new Container(
                            padding: new EdgeInsets.all(20.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  padding: new EdgeInsets.only(bottom: 10.0),
                                  child: new Text(
                                    vm.presentationName,
                                    style: new TextStyle(
                                      fontSize: 30.0
                                    ),
                                  ),
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Container(
                                      padding: new EdgeInsets.only(right: 5.0),
                                      child: new Icon(
                                        Icons.place,
                                        size: 18.0,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    new Text(
                                      makeDistanceDescription(vm.user.distance),
                                      style: new TextStyle(
                                        color: Colors.black45,
                                        fontSize: 18.0
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      new Container(
                        alignment: new Alignment(1.0, 0.0),
                        padding: new EdgeInsets.symmetric(horizontal: backButtonIconSize / 2),
                        transform: new Matrix4.translationValues(0.0, MediaQuery.of(context).size.width - (backButtonIconSize / 2 + 10), 1.0),
                        child: new RoundedButtonIcon(
                          color: Colors.redAccent,
                          iconColor: Colors.white,
                          icon: Icons.arrow_downward,
                          iconSize: backButtonIconSize,
                          padding: 10.0,
                          onPressed: vm.onNavigateBack(context),
                        ),
                      )
                    ],
                  ),
                  new Divider(
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  new Container(
                    padding: new EdgeInsets.all(20.0),
                    child: new Text(
                      vm.user.description,
                      style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                  new Divider(
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  new Container(
                    padding: new EdgeInsets.all(20.0),
                    child: new Text(
                      'My Music',
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ],
              )
            ]
          ),
        );
      }
    );
  }
}

class ViewModel {
  ViewModel({
    this.presentationName,
    this.selectedImageUrl,
    this.selectedImageIndex,
    this.user,
    this.onCurrentImageIndexChanged,
  });

  static ViewModel fromStore(Store<AppState> store) =>
    new ViewModel(
      presentationName: userPresentationNameSelector(store),
      selectedImageUrl: userSelectedImageUrlSelector(store),
      selectedImageIndex: userSelectedImageIndexSelector(store),
      user: userSelector(store).user,
      onCurrentImageIndexChanged: (int imageIndex) =>
        store.dispatch(new ChangeSelectedImageIndexAction(imageIndex)),
    );

  final String presentationName;
  final String selectedImageUrl;
  final int selectedImageIndex;
  final UserEntity user;
  final Function onCurrentImageIndexChanged;

  Function onNavigateBack(BuildContext context) =>
    () => Navigator.of(context).pop();
}
