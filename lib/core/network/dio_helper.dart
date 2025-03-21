import 'package:dio/dio.dart';
import 'package:graduation_project/core/network/api_endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }

  static Future<Response> post({
    required String url,
    required dynamic data,
  }) async {
    return await dio.post(url, data: data);
  }
}
