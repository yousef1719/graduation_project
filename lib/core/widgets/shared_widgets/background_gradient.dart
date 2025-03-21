// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/constants.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    final double radiusValue = 55.r;
    final double containerHeight = radiusValue;

    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Container(
            height: 0.5.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kPrimaryColor, kBackgroundColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: (0.5.sh) - (containerHeight / 1),
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(radiusValue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
