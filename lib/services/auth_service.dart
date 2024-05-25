import 'package:dio/dio.dart';
import 'package:task_manager/constants/server_constants.dart';
import 'package:task_manager/services/network_service.dart';

class AuthService {
  static Future<Response> login(String email, String password) async {
    final response =
        await NetworkService.dio.post('${ServerConstants.apiUrl}/login',
            data: FormData.fromMap({
              'username': email,
              'password': password,
            }));
    return response.data;
  }

  static Future<Response> register(
      String name, String email, String password) async {
    final response = await NetworkService.dio.post(
      '${ServerConstants.apiUrl}/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    return response.data;
  }
}
