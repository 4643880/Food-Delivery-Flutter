import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double textheight;
  SmallText(
      {super.key,
      required this.text,
      this.color = const Color(0xFFccc7c5),
      this.size = 12,
      this.textheight = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        height: textheight,
      ),
    );
  }
}
