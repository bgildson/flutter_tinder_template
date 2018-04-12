import 'package:meta/meta.dart';

@immutable
class UserEntity {
  UserEntity({
    this.id: '',
    this.name: '',
    this.age: 0,
    this.description: '',
    List<String> images,
  }) : this.images = images ?? [];

  factory UserEntity.fromJson(Map<String, dynamic> data) {
    return new UserEntity(
      id: data['id'] as String,
      name: data['name'] as String,
      age: data['age'] as int,
      description: data['description'] as String,
      images: data['images'] as List<String>,
    );
  }

  final String id;
  final String name;
  final int age;
  final String description;
  final List<String> images;

  UserEntity copyWith({
    String id,
    String name,
    int age,
    String description,
    List<String> images,
  }) {
    return new UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      description: description ?? this.description,
      images: images ?? this.images,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'description': description,
      'images': images,
    };
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, age: $age, description: $description}, images: $images';
  }

  @override
  int get hashCode =>
    id.hashCode ^
    name.hashCode ^
    age.hashCode ^
    description.hashCode ^
    images.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    this.runtimeType == other.runtimeType &&
    id == other.id &&
    name == other.name &&
    age == other.name &&
    description == other.description &&
    images == other.images;
}
