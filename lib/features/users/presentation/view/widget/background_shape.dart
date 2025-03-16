import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class BackgroundShape extends StatelessWidget {
  const BackgroundShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          heightFactor: 0.23,
          widthFactor: 1,
          child: Container(
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
