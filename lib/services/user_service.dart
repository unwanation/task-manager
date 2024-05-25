import 'package:dio/dio.dart';
import 'package:task_manager/constants/server_constants.dart';

class UserService {
  final dio = Dio();

  Future<Response> login(String email, String password) async {
    final response = await dio.get(
      '${ServerConstants.apiUrl}/user/get',
      data: {
        'email': email,
        'password': password,
      },
    );
    return response;
  }
}
