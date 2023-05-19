import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helper/app_colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    super.key,
    required this.currentPageValue,
  });

  final double currentPageValue;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 5,
      position: currentPageValue.toInt(),
      decorator: DotsDecorator(
        activeColor: AppColors.mainColor,
        size: const Size.square(9.0),
        activeSize: Size(18.0.w, 9.0.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0).r,
        ),
      ),
    );
  }
}
