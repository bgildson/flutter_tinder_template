import 'package:flutter_tinder_template/entities/entities.dart';

enum UserActions {
  Load,
  LoadSuccess,
  LoadFail,
}

class LoadUserAction { }

class LoadUserSuccessAction {
  final UserEntity user;

  LoadUserSuccessAction(this.user);

  @override
  String toString() => 'LoadUserSuccessAction{user: $user}';
}

class LoadUserFailAction {
  final String message;

  LoadUserFailAction(this.message);

  @override
  String toString() => 'LoadUserFailAction{message: $message}';
}
