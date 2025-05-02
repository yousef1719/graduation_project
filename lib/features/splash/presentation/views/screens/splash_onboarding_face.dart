import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/addition_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/background_Gradient.dart';
import 'package:graduation_project/core/widgets/shared_widgets/circle_progress_indicator.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/biometric_onboarding.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/splash_reg_view_body.dart';

class SplashOnboardingFace extends StatelessWidget {
  const SplashOnboardingFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundGradient(),
        Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: AdditionTextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashRegViewBody(),
                        ),
                        (route) => false,
                      );
                    },
                    text: 'Skip',
                    color: kBackgroundColor,
                    fontsize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Image.asset(
                  AssetsData.facescan,
                  width: 326.w,
                  height: 326.h,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome',
                        style: Styles(
                          fontWeight: FontWeight.w800,
                          color: kTextColor,
                          fontSize: 30.sp,
                        ).textStyleInter,
                      ),
                      Text(
                        ' to ',
                        style: Styles(
                                fontWeight: FontWeight.w800,
                                color: kSecondaryColor,
                                fontSize: 30.sp)
                            .textStyleInter,
                      ),
                    ],
                  ),
                  Text(
                    ' Recognition. ',
                    style: Styles(
                            fontWeight: FontWeight.w800,
                            color: kSecondaryColor,
                            fontSize: 30.sp)
                        .textStyleInter,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.h, bottom: 72.h),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Unlock the power of facial\n recognition effortlessly.',
                        style: Styles(
                                fontWeight: FontWeight.w400,
                                color: kTextColor,
                                fontSize: 16.sp)
                            .textStyleInter,
                      ),
                    ),
                  )
                ],
              ),
              CircleProgressIndicator(
                value: 0.5,
                angel: -3.14 / 2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BiometricOnboarding()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
