import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/custom_text_button.dart';
import 'package:graduation_project/features/camera/views/camera_screensss.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Face scan in progress... \nlet’s recognize your face.',
                textAlign: TextAlign.center,
                style: Styles(
                        color: kTextColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600)
                    .textStyleInter,
              ),
            ),
            SizedBox(height: 60.h),
            Image.asset(
              AssetsData.scanlogo,
              width: 372.w,
              height: 266.h,
            ),
            SizedBox(height: 70.h),
            Text(
              'Please center your face.',
              style: Styles(
                      color: Color(0xff575A5B),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600)
                  .textStyleInter,
            ),
            SizedBox(height: 25.h),
            CustomTextButton(
              color: kPrimaryColor,
              text: 'Scan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraScreensss(),
                  ),
                );
              },
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
