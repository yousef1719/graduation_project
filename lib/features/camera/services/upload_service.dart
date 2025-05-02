import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:graduation_project/core/network/api_endpoints.dart';
import 'package:graduation_project/core/network/dio_helper.dart';
import 'package:graduation_project/core/models/user_model.dart';
import 'package:graduation_project/core/utils/file_utils.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class UploadService {
  Future<UserModel?> uploadImageAndGetUser(File imageFile) async {
    try {
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      };

      final cleanFileName = generateCleanFileName();

      final formData = dio.FormData.fromMap({
        'image': await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: cleanFileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      final response = await DioHelper.post(
        url: ApiEndpoints.recognize,
        data: formData,
        options: dio.Options(headers: headers),
      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;

        if (data.containsKey('error')) {
          throw Exception(data['error']);
        }
        return UserModel.fromJson(data);
      } else {
        final errorMsg = response.data['error'] ?? 'Unknown error';
        throw Exception(errorMsg);
      }
    } on dio.DioException catch (e) {
      log('Dio Error: ${e.message}');
      return null;
    } catch (e) {
      log('General Error: $e');
      return null;
    }
  }
}
