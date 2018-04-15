import 'package:meta/meta.dart';
import 'package:flutter_tinder_template/models/models.dart';

@immutable
class AppState {
  AppState({
    this.isLoading: false,
    this.mainInitialPage,
    User user,
    Matchs matchs,
  }) : this.user = user ?? new User.loading(),
       this.matchs = matchs ?? new Matchs.loading();

  final bool isLoading;
  final int mainInitialPage;
  final User user;
  final Matchs matchs;

  AppState copyWith({
    bool isLoading,
    int mainInitialPage,
    User user,
    Matchs matchs,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      mainInitialPage: mainInitialPage ?? this.mainInitialPage,
      user: user ?? this.user,
      matchs: matchs ?? this.matchs,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    mainInitialPage.hashCode ^
    user.hashCode ^
    matchs.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    mainInitialPage == other.mainInitialPage &&
    user == other.user &&
    matchs == other.matchs;

  @override
  String toString() =>
    'AppState{isLoading: $isLoading, mainInitialPage: $mainInitialPage, user: $user, matchs: $matchs}';
}
