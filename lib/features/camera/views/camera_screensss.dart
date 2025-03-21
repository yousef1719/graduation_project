import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/camera/controllers/camera_controller.dart';

class CameraScreensss extends StatelessWidget {
  CameraScreensss({super.key});
  final controller = Get.put(CameraScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 22.sp, color: kBackgroundColor),
          onPressed: () => Get.back(),
        ),
        title: Center(
          child: Text(
            'Camera',
            style:
                Styles(color: kBackgroundColor, fontSize: 22.sp).textStyleInter,
          ),
        ),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  controller.isVerticalMode.value
                      ? Icons.screen_lock_portrait
                      : Icons.screen_lock_landscape,
                  size: 22.sp,
                  color: kBackgroundColor,
                ),
                onPressed: controller.toggleOrientation,
              )),
        ],
      ),
      body: GetBuilder<CameraScreenController>(
        builder: (_) {
          return Stack(
            children: [
              OrientationBuilder(builder: (context, orientation) {
                return FutureBuilder(
                  future: controller.initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (controller.cameraController.value.isInitialized) {
                        return Obx(() => Transform.rotate(
                              angle: controller.isVerticalMode.value
                                  ? 0
                                  : orientation == Orientation.landscape
                                      ? -90 * (3.141592653589793 / 180)
                                      : 90 * (3.141592653589793 / 180),
                              child: CameraPreview(controller.cameraController),
                            ));
                      } else {
                        return Center(
                            child: Text(
                          "Camera not available",
                          style: Styles(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600)
                              .textStyleInter,
                        ));
                      }
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 3.w,
                      ));
                    }
                  },
                );
              }),
              Obx(
                () => controller.isLoading.value
                    ? Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.w,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        backgroundColor: kPrimaryColor,
        heroTag: null,
        onPressed: controller.captureAndUpload,
        child: SvgPicture.asset(AssetsData.camerabutton),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
