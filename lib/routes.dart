import 'package:flutter/material.dart';
import 'package:task_manager/screens/home_screen.dart';
import 'package:task_manager/screens/login_screen.dart';
import 'package:task_manager/screens/new_task_screen.dart';
import 'package:task_manager/screens/registration_screen.dart';
import 'package:task_manager/services/auth_service.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String newTask = '/new-task';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
    registration: (context) => const RegistrationScreen(),
    newTask: (context) => NewTaskScreen(),
  };

  static String getInitial() {
    return AuthService.isLoggedIn ? home : registration;
  }
}
