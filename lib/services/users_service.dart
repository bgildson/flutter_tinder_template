import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_tinder_template/entities/entities.dart';

class UsersService {
  static String baseUrl = 'https://randomuser.me/api';

  static Future<UserEntity> loadCurrentUser() async {
    return (await loadUsers(
      results: 1,
      gender: Gender.male,
      generateImages: true,
      numberImages: 3
    ))[0];
  }

  static Future<List<UserEntity>> loadMatchs() async {
    return loadUsers(
      results: 10,
      gender: Gender.female,
    );
  }

  static Future<List<UserEntity>> loadStrangers() async {
    return loadUsers(
      results: 1,
      gender: Gender.female,
      generateImages: true,
    );
  }

  static Future<List<UserEntity>> loadUsers({
    int results,
    Gender gender,
    bool generateImages: false,
    int numberImages: 3,
  }) async {
    assert(generateImages != null);
    assert(!generateImages || (numberImages == null || numberImages > 0 && numberImages < 7));

    http.Response response = await loadUsersRaw(
      results: results,
      gender: gender,
    );

    List usersData = json.decode(response.body)['results'];
    Random random = new Random();

    List<UserEntity> _users = [];
    for (var userData in usersData) {
      String dob = userData['dob']['date'];
      int age = (new DateTime.now().difference(DateTime.parse(dob)).inDays / 365).floor();

      Gender _gender;
      if (userData['gender'].toString().toLowerCase() == 'male') {
        _gender = Gender.male;
      } else {
        _gender = Gender.female;
      }

      List<String> images = [];
      if (generateImages) {
        int _numberImages = numberImages;
        if (_numberImages == null)
          _numberImages = random.nextInt(5) + 1;
        images = await loadImages(
          results: _numberImages,
          gender: _gender
        );
      } else {
        images = [userData['picture']['large'] as String];
      }

      _users.add(new UserEntity(
        id: userData['id']['value'] as String,
        name: userData['name']['first'] as String,
        age: age,
        description: 'My Description',
        gender: _gender,
        images: images,
        distance: random.nextInt(100),
      ));
    }

    return _users;
  }

  static Future<List<String>> loadImages({
    @required int results,
    Gender gender,
  }) async {
    List<UserEntity> users = await loadUsers(
      results: results,
      gender: gender,
    );
    return users.map((UserEntity user) => user.images[0]).toList();
  }

  static Future<http.Response> loadUsersRaw({
    int results,
    Gender gender,
  }) async {
    List<String> args = [];

    if (results != null)
      args.add('results=$results');

    if (gender != null) {
      if (gender == Gender.male) {
        args.add('gender=male');
      } else {
        args.add('gender=female');
      }
    }

    String url = baseUrl;
    if (args.length > 0)
      url = '$url?${args.join("&")}';

    return http.get(url);
  }
}
