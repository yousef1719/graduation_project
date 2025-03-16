// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kPrimaryColor, kBackgroundColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          left: 0,
          right: 0,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
