import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/shared_widgets/addition_text_button.dart';
import 'package:graduation_project/core/widgets/shared_widgets/background_gradient.dart';
import 'package:graduation_project/core/widgets/shared_widgets/circle_progress_indicator.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/secure_onboarding.dart';
import 'package:graduation_project/features/splash/presentation/views/screens/splash_reg_view_body.dart';

class BiometricOnboarding extends StatelessWidget {
  const BiometricOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundGradient(),
        Positioned(
          top: 25.h,
          left: 10.w,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                size: 20.sp, color: kBackgroundColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: AdditionTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashRegViewBody(),
                        ),
                      );
                    },
                    text: 'Skip',
                    color: kBackgroundColor,
                    fontsize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                child: Image.asset(
                  AssetsData.biometricphoto,
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
                        'SMART',
                        style: Styles(
                          fontWeight: FontWeight.w800,
                          color: kSecondaryColor,
                          fontSize: 20.sp,
                        ).textStyleInter,
                      ),
                      Text(
                        ' & ',
                        style: Styles(
                                fontWeight: FontWeight.w800,
                                color: kTextColor,
                                fontSize: 20.sp)
                            .textStyleInter,
                      ),
                      Text(
                        'ACCURATE',
                        style: Styles(
                          fontWeight: FontWeight.w800,
                          color: kSecondaryColor,
                          fontSize: 20.sp,
                        ).textStyleInter,
                      ),
                    ],
                  ),
                  Text(
                    ' Technology. ',
                    style: Styles(
                            fontWeight: FontWeight.w800,
                            color: kTextColor,
                            fontSize: 20.sp)
                        .textStyleInter,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Powered by cutting-edge AI for reliable ',
                    style: Styles(
                            fontWeight: FontWeight.w400,
                            color: kTextColor,
                            fontSize: 12.sp)
                        .textStyleInter,
                  ),
                  Text(
                    'recognition.',
                    style: Styles(
                            fontWeight: FontWeight.w400,
                            color: kTextColor,
                            fontSize: 14.sp)
                        .textStyleInter,
                  )
                ],
              ),
              SizedBox(
                height: 105.h,
              ),
              CircleProgressIndicator(
                value: 0.75,
                angel: -3.14 / 2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecureOnboarding(),
                    ),
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
