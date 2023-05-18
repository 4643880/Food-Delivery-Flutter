import 'package:flutter/material.dart';

class MyCustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final Function()? function;

  const MyCustomIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = const Color(0xfffcf4e4),
    this.iconColor = const Color(0xff756d54),
    this.size = 45,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(size / 2),
          ),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
