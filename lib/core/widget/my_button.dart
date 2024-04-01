
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double? topLeft;
  final double? topRight;
  final double? bottomRight;
  final double? bottomLeft;
  final String text;
  final Function() onPressed;

  final Color buttonColor;
  final TextStyle style;

  const MyButton(
      {super.key,
      this.topLeft = 0,
      this.topRight = 0,
      this.bottomRight = 0,
      this.bottomLeft = 0,
      required this.text,
      required this.onPressed,

      required this.buttonColor,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 50,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft!),
            topRight: Radius.circular(topRight!),
            bottomRight: Radius.circular(bottomRight!),
            bottomLeft: Radius.circular(bottomLeft!),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: style));
  }
}
