import 'package:flutter/material.dart';
import 'package:task_manager/models/user.dart';
import 'package:task_manager/services/network_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  String? _accessToken;
  String? _refreshToken;

  User? get user {
    return _user;
  }

  String? get accessToken {
    return _accessToken;
  }

  String? get refreshToken {
    return _refreshToken;
  }

  void updateTokens(Map tokens) {
    _accessToken = tokens['access_token'];
    _refreshToken = tokens['refresh_token'];
    NetworkService.setToken(_accessToken!);
  }
}
