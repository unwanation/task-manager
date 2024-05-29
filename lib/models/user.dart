import 'package:task_manager/models/space.dart';

class User {
  final String uuid;
  final String name;
  final String email;
  List<Space> spaces;

  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.spaces,
  });
}
