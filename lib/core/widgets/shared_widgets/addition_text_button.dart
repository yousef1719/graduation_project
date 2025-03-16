import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdditionTextButton extends StatelessWidget {
  AdditionTextButton(
      {required this.text,
      required this.color,
      required this.fontsize,
      this.onPressed,
      super.key});

  String text;
  Color color;
  double fontsize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: color,
            fontSize: fontsize),
      ),
    );
  }
}
