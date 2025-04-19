import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/styles.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Divider(
              thickness: 2.h,
              color: Colors.black,
              indent: 30.w,
              endIndent: 5.w,
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                'or continue with',
                style: Styles(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff4B4B4B),
                        fontSize: 12.sp)
                    .textStyleInter,
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2.h,
                color: kPrimaryColor,
                indent: 5.w,
                endIndent: 30.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
