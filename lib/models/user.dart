import 'package:meta/meta.dart';

import 'package:flutter_tinder_template/entities/user_entity.dart';

@immutable
class User {
  User({
    this.isLoading: false,
    this.selectedImageIndex: 0,
    UserEntity user,
  }) : this.user = user ?? new UserEntity();

  factory User.loading() => new User(isLoading: true);

  final bool isLoading;
  final int selectedImageIndex;
  final UserEntity user;

  User copyWith({bool isLoading, int selectedImageUrl, UserEntity user}) {
    return new User(
      isLoading: isLoading ?? this.isLoading,
      selectedImageIndex: selectedImageUrl ?? this.selectedImageIndex,
      user: user ?? this.user,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    selectedImageIndex.hashCode ^
    user.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    this.isLoading == other.isLoading &&
    this.selectedImageIndex == other.selectedImageIndex &&
    this.user == other.user;

  @override
  String toString() {
    return 'User{isLoading: $isLoading, selectedImage: $selectedImageIndex, user: $user}';
  }
}
