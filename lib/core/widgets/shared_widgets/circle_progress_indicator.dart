import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';

class CircleProgressIndicator extends StatelessWidget {
  const CircleProgressIndicator({
    required this.angel,
    this.onPressed,
    required this.value,
    super.key,
  });

  final VoidCallback? onPressed;
  final double angel;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Transform.rotate(
            angle: angel,
            child: SizedBox(
              width: 68.w,
              height: 68.h,
              child: GestureDetector(
                onTap: onPressed,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 3.w,
                  backgroundColor: Colors.transparent,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF144D5C)),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              height: 60.h,
              width: 60.w,
              child: Icon(
                Icons.arrow_forward,
                color: kBackgroundColor,
                size: 24.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
