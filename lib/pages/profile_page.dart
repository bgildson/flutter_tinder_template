import 'package:flutter/material.dart';

import '../ui/profile_button.dart';
import '../ui/profile_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double imageSizes = MediaQuery.of(context).size.width / 3;
    return new ProfileCard(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: new Container(
            child: new DecoratedBox(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage('https://picsum.photos/300?image=38'),
                ),
              ),
            ),
            height: imageSizes,
            width: imageSizes,
          ),
        ),
        new Padding(
          child: new Text(
            'Carol, 26',
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
