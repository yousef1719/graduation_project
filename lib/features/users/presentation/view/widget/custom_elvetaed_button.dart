import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text!,
          style: Styles(color: color, fontSize: 16, fontWeight: FontWeight.w700)
              .textStyleInter,
        ),
      ),
    );
  }
}
