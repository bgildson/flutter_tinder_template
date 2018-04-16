import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/presentation/profile_button.dart';
import 'package:flutter_tinder_template/presentation/profile_card.dart';
import 'package:flutter_tinder_template/selectors/selectors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageSizes = MediaQuery.of(context).size.width / 3;
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return new ProfileCard(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: new Hero(
                tag: 'user-profile-image-${vm.selectedImageIndex}',
                child: new Container(
                  child: new GestureDetector(
                    onTap: vm.onNavigateToDetails(context),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: vm.selectedImageUrl == ''
                            ? new AssetImage('images/empty.jpg')
                            : new NetworkImage(vm.selectedImageUrl),
                        ),
                      ),
                    ),
                  ),
                  height: imageSizes,
                  width: imageSizes,
                ),
              ),
            ),
            new Padding(
              child: new Text(
                vm.presentationName,
                style: new TextStyle(
                  fontSize: 30.0
                )
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0)
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: new Table(
                children: <TableRow>[
                  new TableRow(
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                          border: new BorderDirectional(
                            end: new BorderSide(
                              color: Colors.black12,
                              width: 1.0,
                            )
                          )
                        ),
                        child: new ProfileButton(
                          icon: Icons.settings,
                          text: 'Configurations',
                          activeColor: Colors.black26,
                          iconActiveColor: Colors.black38,
                          onPressed: () => print('Configurations')
                        ),
                      ),
                      new ProfileButton(
                        icon: Icons.create,
                        text: 'Edit Info',
                        activeColor: Colors.redAccent,
                        iconActiveColor: Colors.white,
                        onPressed: vm.onNavigateToDetails(context)
                      ),
                    ]
                  )
                ],
              )
            )
          ]
        );
      }
    );
  }
}

class ViewModel {
  ViewModel(
    this.presentationName,
    this.selectedImageUrl,
    this.selectedImageIndex,
  );

  static ViewModel fromStore(Store<AppState> store) =>
    new ViewModel(
      userPresentationNameSelector(store),
      userSelectedImageUrlSelector(store),
      userSelectedImageIndexSelector(store),
    );

  final String presentationName;
  final String selectedImageUrl;
  final int selectedImageIndex;

  onNavigateToDetails(BuildContext context) =>
    () => Navigator.pushNamed(context, '/user-profile-details');
}
