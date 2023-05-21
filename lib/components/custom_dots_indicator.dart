import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final PopularProductController controller;
  const DotsIndicatorWidget({
    super.key,
    required this.currentPageValue,
    required this.controller,
  });

  final double currentPageValue;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: controller.getPopularProductList.isEmpty
          ? 1
          : controller.getPopularProductList.length,
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
