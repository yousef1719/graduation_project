import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? cameras;
  bool isVerticalMode = true;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      _cameraController = CameraController(firstCamera, ResolutionPreset.high);
      _initializeControllerFuture = _cameraController.initialize();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to initialize camera: $e')),
      );
    }
  }

  void _toggleOrientation() {
    setState(() {
      isVerticalMode = !isVerticalMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 22, color: kBackgroundColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Camera',
            style: Styles(color: kBackgroundColor, fontSize: 22).textStyleInter,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              color: kBackgroundColor,
              isVerticalMode
                  ? Icons.screen_lock_portrait
                  : Icons.screen_lock_landscape,
            ),
            onPressed: _toggleOrientation,
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (_cameraController.value.isInitialized) {
                  return Transform.rotate(
                    angle: isVerticalMode
                        ? 0
                        : orientation == Orientation.landscape
                            ? -90 * (3.141592653589793 / 180)
                            : 90 * (3.141592653589793 / 180),
                    child: CameraPreview(_cameraController),
                  );
                } else {
                  return Center(child: Text("Camera not available"));
                }
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ));
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: kPrimaryColor,
        heroTag: null,
        onPressed: () async {
          if (_cameraController.value.isInitialized) {
            final image = await _cameraController.takePicture();
            // ignore: avoid_print
            print("Image Path: ${image.path}");
          }
        },
        child: Image.asset(AssetsData.camerabutton),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
