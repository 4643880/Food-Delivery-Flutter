import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/helper/app_colors.dart';

class BottonBarOfPopularFoodScreen extends StatelessWidget {
  const BottonBarOfPopularFoodScreen({
    super.key,
  });

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: 20.w,
                ),
                SmallText(
                  text: "1",
                  color: AppColors.signColor,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const Icon(
                  Icons.add,
                  color: AppColors.signColor,
                ),
              ],
            ),
          ),

          // Add to Cart Button
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15).r,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.all(const Radius.circular(12).r),
            ),
            child: SmallText(
              text: "\$0.08 Add to Cart",
              size: 15.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
