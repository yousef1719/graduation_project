import 'package:camera/camera.dart';

class CameraService {
  late CameraController cameraController;
  Future<void>? initializeControllerFuture;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw Exception('No cameras found');
    }

    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    cameraController = CameraController(
      backCamera,
      ResolutionPreset.veryHigh,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    initializeControllerFuture = cameraController.initialize();
    await initializeControllerFuture;
  }

  Future<XFile> takePicture() async {
    if (!cameraController.value.isInitialized) {
      throw Exception('Camera is not initialized');
    }
    return await cameraController.takePicture();
  }

  void dispose() {
    cameraController.dispose();
  }
}
