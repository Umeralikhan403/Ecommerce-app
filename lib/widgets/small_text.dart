import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double? height;

  SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xffccc7c5),
    this.size = 11,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: size,
          fontFamily: 'Muli',
          fontWeight: FontWeight.bold),
    );
  }
}
