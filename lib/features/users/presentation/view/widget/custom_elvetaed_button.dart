import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/styles.dart';

// ignore: must_be_immutable
class CustomElvetaedButton extends StatelessWidget {
  CustomElvetaedButton(
      {this.color, this.backgroundcolor, this.onPressed, this.text, super.key});
  String? text;
  final VoidCallback? onPressed;
  Color? backgroundcolor;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          text!,
          style:
              Styles(color: color, fontSize: 16.sp, fontWeight: FontWeight.w700)
                  .textStyleInter,
        ),
      ),
    );
  }
}
