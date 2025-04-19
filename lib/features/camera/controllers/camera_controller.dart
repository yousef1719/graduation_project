import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:graduation_project/core/network/api_endpoints.dart';
import 'package:graduation_project/core/network/dio_helper.dart';
import 'package:graduation_project/core/models/user_model.dart';

class CameraScreenController extends GetxController {
  late CameraController cameraController;
  Future<void>? initializeControllerFuture;
  RxBool isVerticalMode = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    DioHelper.init();
    initCamera();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

  void toggleOrientation() {
    isVerticalMode.value = !isVerticalMode.value;
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        Get.snackbar('Error', 'No cameras found');
        return;
      }
      final firstCamera = cameras.first;
      cameraController = CameraController(firstCamera, ResolutionPreset.high);
      initializeControllerFuture = cameraController.initialize();
      await cameraController.initialize();
      update();
    } catch (e) {
      log('Failed to initialize camera: $e');
      Get.snackbar('Error', 'Failed to initialize camera');
    }
  }

  Future<UserModel?> captureAndUpload() async {
    if (!cameraController.value.isInitialized) return null;

    try {
      isLoading.value = true;

      final image = await cameraController.takePicture();
      log('Image Path: ${image.path}');

      final userModel = await uploadImageAndGetUser(image.path);

      if (userModel != null) {
        Get.toNamed('/userInformation', arguments: userModel);
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

  Future<UserModel?> uploadImageAndGetUser(String imagePath) async {
    try {
      final fileName = imagePath.split('/').last;

      final formData = dio.FormData.fromMap({
        'image':
            await dio.MultipartFile.fromFile(imagePath, filename: fileName),
      });

      final response = await DioHelper.post(
        url: ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        Get.snackbar('Error', 'Failed to upload image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Upload error: $e');
      Get.snackbar('Error', 'Something went wrong');
      return null;
    }
  }
}
