import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String text;

  const IconAndTextWidget({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: iconColor),
        SizedBox(width: 5.w),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
