import 'package:dio/dio.dart';
import 'package:task_manager/constants/server_constants.dart';

class NetworkService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: ServerConstants.apiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  static Future<Response> get(String url) async {
    final response = await dio.get(url);
    return response;
  }

  static Future<Response> post(String url, Object data) async {
    final response = await dio.post(url, data: data);
    return response;
  }

  static void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future refreshTokens(String token) async {
    final response =
        await dio.get('${ServerConstants.apiUrl}/refresh?token=$token');

    return response.data;
  }
}
