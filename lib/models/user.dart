import 'package:meta/meta.dart';

import 'package:flutter_tinder_template/entities/user_entity.dart';

@immutable
class User {
  User({
    this.isLoading: false,
    this.selectedImageUrl: '',
    UserEntity user,
  }) : this.user = user ?? new UserEntity();

  factory User.loading() => new User(isLoading: true);

  final bool isLoading;
  final String selectedImageUrl;
  final UserEntity user;

  User copyWith({UserEntity user, bool isLoading, String selectedImageUrl}) {
    return new User(
      isLoading: isLoading ?? this.isLoading,
      selectedImageUrl: selectedImageUrl ?? this.selectedImageUrl,
      user: user ?? this.user,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    selectedImageUrl.hashCode ^
    user.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    this.isLoading == other.isLoading &&
    this.selectedImageUrl == other.selectedImageUrl &&
    this.user == other.user;

  @override
  String toString() {
    return 'User{isLoading: $isLoading, selectedImage: $selectedImageUrl, user: $user}';
  }
}
