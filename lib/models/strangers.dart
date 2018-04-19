import 'package:flutter/foundation.dart';
import 'package:flutter_tinder_template/entities/entities.dart';

@immutable
class Strangers {
  Strangers({
    this.isLoading: false,
    this.strangers: const [],
  });

  factory Strangers.loading() => new Strangers(isLoading: true);

  final bool isLoading;
  final List<UserEntity> strangers;

  Strangers copyWith({
    bool isLoading,
    List<UserEntity> strangers,
  }) {
    return new Strangers(isLoading: isLoading ?? this.isLoading, strangers: strangers ?? this.strangers,);
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    strangers.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    strangers == other.strangers;

  @override
  String toString() =>
    'Strangers{isLoading: $isLoading, strangers: $strangers}';
}
