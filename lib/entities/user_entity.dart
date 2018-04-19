import 'package:meta/meta.dart';

enum Gender {
  male,
  female,
}

@immutable
class UserEntity {
  UserEntity({
    this.id: '',
    this.name: '',
    this.age: 0,
    this.description: '',
    this.gender: Gender.male,
    this.images: const [],
    this.distance: 0,
  });

  factory UserEntity.fromJson(Map<String, dynamic> data) {
    Gender gender;

    if (data['gender'].toString().toLowerCase() == 'male') {
      gender = Gender.male;
    } else {
      gender = Gender.female;
    }

    return new UserEntity(
      id: data['id'] as String,
      name: data['name'] as String,
      age: data['age'] as int,
      description: data['description'] as String,
      gender: gender,
      images: data['images'] as List<String>,
      distance: data['distance'] as int,
    );
  }

  final String id;
  final String name;
  final int age;
  final String description;
  final Gender gender;
  final List<String> images;
  final int distance;

  UserEntity copyWith({
    String id,
    String name,
    int age,
    String description,
    Gender gender,
    List<String> images,
    int distance,
  }) {
    return new UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      images: images ?? this.images,
      distance: distance ?? this.distance,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'description': description,
      'gender': gender,
      'images': images,
      'distance': distance,
    };
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, age: $age, description: $description, gender: $gender, images: $images, distance: $distance}';
  }

  @override
  int get hashCode =>
    id.hashCode ^
    name.hashCode ^
    age.hashCode ^
    description.hashCode ^
    gender.hashCode ^
    images.hashCode ^
    distance.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    id == other.id &&
    name == other.name &&
    age == other.name &&
    description == other.user &&
    gender == other.gender &&
    images == other.images &&
    distance == other.distance;
}
