import 'package:dio/dio.dart';
import 'package:task_manager/constants/server_constants.dart';
import 'package:task_manager/services/storage_service.dart';

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

  static Future<Response> post(String url, Object? data) async {
    final response = await dio.post(url, data: data);
    return response;
  }

  static Future<Response> delete(String url) async {
    final response = await dio.delete(url);
    return response;
  }

  static Future<Response> put(String url, Object data) async {
    final response = await dio.put(url, data: data);
    return response;
  }

  static setToken(String? token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      await get('${ServerConstants.apiUrl}/user/get');
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 403) {
        await refreshTokens();
      }
    }
  }

  static Future<void> refreshTokens() async {
    final token = await StorageService.read('refresh_token');

    final response =
        await get('${ServerConstants.apiUrl}/user/refresh?token=$token');

    final Map<String, dynamic> tokens = response.data;
    await StorageService.write('access_token', tokens['access_token']!);
    await StorageService.write('refresh_token', tokens['refresh_token']!);
    await setToken(tokens['access_token']);
  }
}
