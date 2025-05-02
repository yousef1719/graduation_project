import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdditionTextButton extends StatelessWidget {
  const AdditionTextButton(
      {required this.text,
      required this.color,
      required this.fontsize,
      this.onPressed,
      super.key});

  final String text;
  final Color color;
  final double fontsize;
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
