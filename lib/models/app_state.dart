import 'package:meta/meta.dart';

import 'package:flutter_tinder_template/models/models.dart';

@immutable
class AppState {
  AppState({
    User user,
  }) : this.user = user ?? new User.loading();

  final User user;

  AppState copyWith({bool isLoading, User user}) {
    return new AppState(
      user: user ?? this.user,
    );
  }

  @override
  int get hashCode => user.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    this.runtimeType == other.runtimeType &&
    user == other.user;

  @override
  String toString() {
    return 'AppState{user: $user}';
  }
}
