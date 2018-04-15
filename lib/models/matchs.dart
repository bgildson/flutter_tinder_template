import 'package:meta/meta.dart';

import 'package:flutter_tinder_template/entities/entities.dart';

@immutable
class Matchs {
  Matchs({
    this.isLoading: false,
    this.matchs: const []
  });

  factory Matchs.loading() => new Matchs(isLoading: true);

  final bool isLoading;
  final List<UserEntity> matchs;

  Matchs copyWith({
    bool isLoading,
    List<UserEntity> matchs,
  }) {
    return new Matchs(
      isLoading: isLoading ?? this.isLoading,
      matchs: matchs ?? this.matchs,
    );
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^ matchs.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    this.runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    matchs == other.matchs;

  @override
  String toString() =>
    'Matchs{isLoading: $isLoading, matchs: $matchs}';
}
