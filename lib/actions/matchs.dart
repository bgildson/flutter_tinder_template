import 'package:flutter_tinder_template/entities/entities.dart';

class LoadMatchsAction {}

class LoadMatchsSuccessAction {
  final List<UserEntity> matchs;

  LoadMatchsSuccessAction(this.matchs);
}

class LoadMatchsFailAction {
  final String message;

  LoadMatchsFailAction(this.message);
}
