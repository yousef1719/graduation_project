import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType {
  filled,
  outlined,
}

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {this.type = ButtonType.filled,
      required this.color,
      required this.text,
      this.onPressed,
      super.key});
  Color color;
  String text;
  final ButtonType type;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            color: type == ButtonType.filled ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: type == ButtonType.outlined
                ? Border.all(color: color, width: 2.w)
                : null,
          ),
          height: 52.h,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: type == ButtonType.filled ? Colors.white : color,
              ),
            ),
          )),
    );
  }
}
