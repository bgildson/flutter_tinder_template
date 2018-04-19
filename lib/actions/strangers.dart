import 'package:flutter_tinder_template/entities/entities.dart';

class LoadStrangersAction {}

class LoadStrangersSuccessAction {
  final List<UserEntity> strangers;

  LoadStrangersSuccessAction(this.strangers);

  @override
  String toString() =>
    'LoadStrangersSuccessAction{strangers: $strangers}';
}

class LoadStrangersFailAction {
  final String message;

  LoadStrangersFailAction(this.message);

  @override
  String toString() =>
    'LoadStrangersFailAction{message: $message}';
}
