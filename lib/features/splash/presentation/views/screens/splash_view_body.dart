import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/splash_onboarding_face.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Get.to(() => SplashOnboardingFace(),
            transition: Transition.fade, duration: kTransitionDuration);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AssetsData.logo,
            width: 149.w,
            height: 153.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'WHO',
            textAlign: TextAlign.center,
            style: Styles(
              color: kPrimaryColor,
              fontSize: 40.sp,
              fontWeight: FontWeight.w400,
            ).textStyleTrad,
          ),
          SizedBox(
            height: 150.h,
          )
        ],
      ),
    );
  }
}
