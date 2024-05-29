import 'package:dio/dio.dart';
import 'package:task_manager/constants/server_constants.dart';
import 'package:task_manager/services/network_service.dart';
import 'package:task_manager/services/storage_service.dart';

class AuthService {
  static bool _isLoggedIn = false;

  static bool get isLoggedIn => _isLoggedIn;

  static loadTokens() async {
    if (await StorageService.isExist('access_token')) {
      final accessToken = await StorageService.read('access_token');
      await NetworkService.setToken(accessToken);
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }
  }

  static login(String email, String password) async {
    final response =
        await NetworkService.dio.post('${ServerConstants.apiUrl}/user/login',
            data: FormData.fromMap({
              'username': email,
              'password': password,
            }));

    final Map<String, dynamic> tokens = response.data;
    await StorageService.write('access_token', tokens['access_token']!);
    await StorageService.write('refresh_token', tokens['refresh_token']!);
  }

  static register(String name, String email, String password) async {
    await NetworkService.post(
      '${ServerConstants.apiUrl}/user/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    await login(email, password);
  }
}
