import 'package:flutter_tinder_template/entities/entities.dart';

class LoadUserAction {}

class LoadUserSuccessAction {
  LoadUserSuccessAction(this.user);

  final UserEntity user;

  @override
  String toString() =>
    'LoadUserSuccessAction{user: $user}';
}

class LoadUserFailAction {
  LoadUserFailAction(this.message);

  final String message;

  @override
  String toString() =>
    'LoadUserFailAction{message: $message}';
}

class ChangeSelectedImageIndexAction {
  ChangeSelectedImageIndexAction(this.selectedImageIndex);

  final int selectedImageIndex;

  @override
  String toString() =>
    'ChangeSelectedImageIndexAction{selectedImageIndex: $selectedImageIndex}';
}
