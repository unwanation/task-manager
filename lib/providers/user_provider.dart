import 'package:flutter/material.dart';
import 'package:task_manager/models/user.dart';
import 'package:task_manager/services/user_service.dart';

class UserProvider with ChangeNotifier {
  User? user;
  int currentSpaceId = 0;

  fetchUser() async {
    user = await UserService.getUser();
    currentSpaceId = user?.spaces[0].id ?? 0;

    notifyListeners();
  }
}
