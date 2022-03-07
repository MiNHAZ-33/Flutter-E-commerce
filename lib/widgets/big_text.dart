import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  String text;
  Color? color;
  TextOverflow? textOverflow;
  double? size;

  BigText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 20,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    overflow: textOverflow,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400
    ),
    );
  }
}
