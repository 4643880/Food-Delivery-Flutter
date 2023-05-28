import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:get/get.dart';

class BottonBarOfCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15).r,
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25).r,
            topRight: const Radius.circular(25).r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Counter
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(12).r),
            ),
            child: GetBuilder<PopularProductController>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  GetBuilder<CartController>(
                    builder: (controller) => SmallText(
                      text: "\$ ${controller.totalAmount}",
                      color: AppColors.signColor,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
            ),
          ),

          // Check Out Button
          GestureDetector(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15).r,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(const Radius.circular(12).r),
              ),
              child: SmallText(
                text: " Check out",
                size: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
