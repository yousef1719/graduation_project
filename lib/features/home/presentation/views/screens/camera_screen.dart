// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/multipart/form_data.dart';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
// import 'package:graduation_project/constants.dart';
// import 'package:graduation_project/core/models/user_model.dart';
// import 'package:graduation_project/core/network/api_endpoints.dart';
// import 'package:graduation_project/core/network/dio_helper.dart';
// import 'package:graduation_project/core/utils/assets.dart';
// import 'package:graduation_project/core/utils/styles.dart';
// import 'package:graduation_project/features/users/presentation/view/screen/user_information.dart';

// import 'package:dio/dio.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _cameraController;
//   Future<void>? _initializeControllerFuture;
//   List<CameraDescription>? cameras;
//   bool isVerticalMode = true;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     DioHelper.init();
//     _initCamera();
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   Future<void> _initCamera() async {
//     try {
//       final cameras = await availableCameras();
//       final firstCamera = cameras.first;
//       _cameraController = CameraController(firstCamera, ResolutionPreset.high);
//       _initializeControllerFuture = _cameraController.initialize();
//     } catch (e) {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to initialize camera: $e')),
//       );
//     }
//   }

//   void _toggleOrientation() {
//     setState(() {
//       isVerticalMode = !isVerticalMode;
//     });
//   }

//   Future<void> _captureAndUpload() async {
//     if (!_cameraController.value.isInitialized) return;

//     try {
//       setState(() => isLoading = true);

//       final image = await _cameraController.takePicture();

//       final userModel = await _uploadImageAndGetUser(image.path);

//       if (!mounted) return;

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => UserInformation(userModel: userModel),
//         ),
//       );
//     } catch (e) {
//       _showError('Error capturing/uploading image: $e');
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   Future<UserModel> _uploadImageAndGetUser(String imagePath) async {
//     final fileName = imagePath.split('/').last;

//     final formData = FormData.fromMap({
//       'image': await MultipartFile.fromFile(imagePath, filename: fileName),
//     });

//     final response = await DioHelper.post(
//       url: ApiEndpoints.uploadImage,
//       data: formData,
//     );

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return UserModel.fromJson(response.data);
//     } else {
//       throw Exception('Failed to upload image. Status: ${response.statusCode}');
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: kPrimaryColor,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, size: 22, color: kBackgroundColor),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Center(
//           child: Text(
//             'Camera',
//             style: Styles(color: kBackgroundColor, fontSize: 22).textStyleInter,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               color: kBackgroundColor,
//               isVerticalMode
//                   ? Icons.screen_lock_portrait
//                   : Icons.screen_lock_landscape,
//             ),
//             onPressed: _toggleOrientation,
//           ),
//         ],
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               FutureBuilder(
//                 future: _initializeControllerFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (_cameraController.value.isInitialized) {
//                       return Transform.rotate(
//                         angle: isVerticalMode
//                             ? 0
//                             : orientation == Orientation.landscape
//                                 ? -90 * (3.141592653589793 / 180)
//                                 : 90 * (3.141592653589793 / 180),
//                         child: CameraPreview(_cameraController),
//                       );
//                     } else {
//                       return Center(child: Text("Camera not available"));
//                     }
//                   } else {
//                     return Center(
//                         child: CircularProgressIndicator(
//                       color: kPrimaryColor,
//                     ));
//                   }
//                 },
//               ),
//               if (isLoading)
//                 Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: const Center(
//                       child: CircularProgressIndicator(color: Colors.white)),
//                 ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         backgroundColor: kPrimaryColor,
//         heroTag: null,
//         onPressed: () async {
//           if (_cameraController.value.isInitialized) {
//             final image = await _cameraController.takePicture();
//             // ignore: avoid_print
//             print("Image Path: ${image.path}");
//           }
//         },
//         child: Image.asset(AssetsData.camerabutton),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
