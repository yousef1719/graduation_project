import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/network/dio_helper.dart';
import 'package:graduation_project/core/models/user_model.dart';
import 'package:graduation_project/features/camera/services/camera_service.dart';
import 'package:graduation_project/features/camera/services/upload_service.dart';

class CameraScreenController extends GetxController {
  final CameraService _cameraService = CameraService();
  final UploadService _uploadService = UploadService();
  RxBool isVerticalMode = true.obs;
  RxBool isLoading = false.obs;
  CameraController get cameraController => _cameraService.cameraController;
  Future<void>? get initializeControllerFuture =>
      _cameraService.initializeControllerFuture;

  @override
  void onInit() {
    super.onInit();
    DioHelper.init();
    initCamera();
  }

  @override
  void onClose() {
    _cameraService.dispose();
    super.onClose();
  }

  void toggleOrientation() {
    isVerticalMode.value = !isVerticalMode.value;
  }

  Future<void> initCamera() async {
    try {
      await _cameraService.initCamera();

      update();
    } catch (e) {
      log('Failed to initialize camera: $e');
      Get.snackbar('Error', 'Failed to initialize camera');
    }
  }

  Future<UserModel?> captureAndUpload() async {
    try {
      isLoading.value = true;

      final image = await _cameraService.takePicture();
      log('Image Path: ${image.path}');

      final userModel =
          await _uploadService.uploadImageAndGetUser(File(image.path));

      if (userModel != null) {
        Get.toNamed('/userInformation', arguments: userModel);
      } else {
        Get.snackbar(
            "Face Not Detected", "Please try again with a clear face photo.");
      }

      return userModel;
    } catch (e) {
      log('Error: $e');
      Get.snackbar('Error', 'Error capturing/uploading image');
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return UserModel.fromJson(response.data);
  //   } else {
  //     Get.snackbar('Error', 'Failed to upload image: ${response.statusCode}');
  //     return null;
  //   }
  // } catch (e) {
  //   log('Upload error: $e');
  //   Get.snackbar('Error', 'Something went wrong');
  //   return null;
  // }


//if (response.statusCode == 200 || response.statusCode == 201) {
    //     log('Upload successful: ${response.data}');
    //     return UserModel.fromJson(response.data);
    //   } else if (response.statusCode == 403) {
    //     log('403 Forbidden response: ${response.data}');
    //     Get.snackbar(
    //         'Error', 'Permission denied. Please check server configuration');
    //     return null;
    //   } else {
    //     final errorMsg = response.data['error'] ?? 'Unexpected server response';
    //     log('Unexpected response: ${response.statusCode} - $errorMsg');
    //     Get.snackbar('Error', errorMsg);
    //     return null;
    //   }
    // } on dio.DioException catch (e) {
    //   log('Dio Error: ${e.message}');
    //   log('Response: ${e.response?.data}');
    //   log('Status Code: ${e.response?.statusCode}');

    //   if (e.response?.statusCode == 403) {
    //     Get.snackbar('Error', 'Server rejected request (403 Forbidden)');
    //   } else {
    //     Get.snackbar('Error', 'Network error occurred');
    //   }
    //   return null;
    // } catch (e) {
    //   log('General Error: $e');
    //   Get.snackbar('Error', 'Something went wrong');
    //   return null;
    // }

    