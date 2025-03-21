import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/assets.dart';

class SocialLogo extends StatelessWidget {
  const SocialLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsData.applelogo,
        ),
        SizedBox(
          width: 20.w,
        ),
        Image.asset(
          AssetsData.googlelogo,
        ),
        SizedBox(
          width: 20.w,
        ),
        Image.asset(
          AssetsData.facebooklogo,
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
