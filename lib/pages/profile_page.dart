import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_tinder_template/models/models.dart';
import 'package:flutter_tinder_template/selectors/selectors.dart';
import '../ui/profile_button.dart';
import '../ui/profile_card.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageSizes = MediaQuery.of(context).size.width / 3;
    return new ProfileCard(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: new Container(
            child: new StoreConnector<AppState, String>(
              converter: userSelectedImageUrlSelector,
              builder: (BuildContext context, String value) {
                return new DecoratedBox(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: value == ''
                        ? new AssetImage('images/empty.jpg')
                        : new NetworkImage(value),
                    ),
                  ),
                );
              },
            ),
            height: imageSizes,
            width: imageSizes,
          ),
        ),
        new Padding(
          child: new StoreConnector<AppState, User>(
            converter: userSelector,
            builder: (BuildContext context, vm) {
              return new Text(
                '${vm.user.name}, ${vm.user.age}',
                style: new TextStyle(
                  fontSize: 30.0
                )
              );
            },
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
                    onPressed: () => print('Edit Info')
                  ),
                ]
              )
            ],
          )
        )
      ]
    );
  }
}
