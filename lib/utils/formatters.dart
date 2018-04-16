import 'package:flutter_tinder_template/entities/user_entity.dart';

String makePresentationName(UserEntity user) {
  String name = user.name;
  if (name != '' && name.length > 0)
    return '${name[0].toUpperCase()}${name.substring(1)}, ${user.age}';
  return '';
}

String makeDistanceDescription(int distance) {
  if (distance < 1)
    return 'less than one kilometer from here';
  return '$distance kilometer${distance > 1 ? "s" : ""} from here';
}
