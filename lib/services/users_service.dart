import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_tinder_template/entities/entities.dart';

class UsersService {
  static String baseUrl = 'https://randomuser.me/api';

  static Future<UserEntity> loadCurrentUser() async {
    var result = await http.get(baseUrl);
    var userData = json.decode(result.body)['results'][0];
    String dob = userData['dob'];
    int age = (new DateTime.now().difference(DateTime.parse(dob)).inDays / 365).floor();
    return new UserEntity(
      id: userData['id']['value'] as String,
      name: userData['name']['first'] as String,
      age: age,
      description: 'My Description',
      images: [
        userData['picture']['large'] as String
      ],
    );
  }

  static Future<List<UserEntity>> loadMatchs() async {
    var result = await http.get('$baseUrl?results=10');
    List matchsData = json.decode(result.body)['results'];
    return matchsData.map((match) {
      String dob = match['dob'];
      int age = (new DateTime.now().difference(DateTime.parse(dob)).inDays / 365).floor();
      return new UserEntity(
        id: match['id']['value'] as String,
        name: match['name']['first'] as String,
        age: age,
        description: 'My Description',
        images: [
          match['picture']['large'] as String
        ],
      );
    }).toList();
  }
}
