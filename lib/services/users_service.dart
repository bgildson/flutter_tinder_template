import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter_tinder_template/entities/entities.dart';

class UsersService {
  static String baseUrl = 'https://randomuser.me/api';

  static Future<UserEntity> loadCurrentUser() async {
    var response = await http.get(baseUrl);
    var userData = json.decode(response.body)['results'][0];
    String dob = userData['dob'];
    int age = (new DateTime.now().difference(DateTime.parse(dob)).inDays / 365).floor();
    List<String> images = [];
    await http.get('$baseUrl?gender=${userData["gender"]}&results=3').then((response) {
      images = (json.decode(response.body)['results'] as List)
        .map((r) => r['picture']['large'] as String).toList();
    });
    return new UserEntity(
      id: userData['id']['value'] as String,
      name: userData['name']['first'] as String,
      age: age,
      description: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
      images: images,
      distance: 0,
    );
  }

  static Future<List<UserEntity>> loadMatchs() async {
    var response = await http.get('$baseUrl?results=10');
    List matchsData = json.decode(response.body)['results'];
    Random random = new Random();
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
        distance: random.nextInt(100),
      );
    }).toList();
  }
}
