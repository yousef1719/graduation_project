import 'package:dio/dio.dart';
import 'package:graduation_project/core/network/api_endpoints.dart';
import 'package:graduation_project/features/camera/controllers/dio_helperss.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 60),
        followRedirects: true,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    )..interceptors.add(LoggingInterceptor());
  }

  static Future<Response> post({
    required String url,
    required dynamic data,
    Options? options,
  }) async {
    try {
      return await dio.post(
        url,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print('Error Response: ${e.response?.data}');
        throw Exception('Server Error: ${e.response?.statusCode}');
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    }
  }
}
