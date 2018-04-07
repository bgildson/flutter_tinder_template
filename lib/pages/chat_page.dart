import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../ui/chat_list_item.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => new _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String urlPeople = 'https://randomuser.me/api?gender=male&results=10';
  List<PersonModel> people = [];

  @override
  void initState() {
    super.initState();

    http.get(urlPeople).then((http.Response response) {
      var results = json.decode(response.body)['results'];
      results.forEach((result) {
        people.add(
          new PersonModel(
            name: result['name']['first'],
            email: result['email'],
            picture: result['picture'],
            gender: result['gender'],
          )
        );
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return new Container(
      color: Colors.white,
      child: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: people.map((person) {
          i += 1;
          return ChatListItem(
            name: person.name,
            lastMessage: 'Last Message Last Message Last Message',
            lastMessageByMe: i % 2 == 0,
            imageUrl: person.picture['medium'],
            onPressed: () => print('chat room pressed'),
          );
        }).toList()
      ),
    );
  }
}

class PersonModel {
  PersonModel({
    this.name,
    this.gender,
    this.email,
    this.picture,
  });

  String name;
  String gender;
  String email;
  Map<String, dynamic> picture;
}
