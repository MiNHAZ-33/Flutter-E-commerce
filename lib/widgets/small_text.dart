import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  double? height;

  SmallText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF89dad0),
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
          color: color,
          fontSize: size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    );
  }
}
