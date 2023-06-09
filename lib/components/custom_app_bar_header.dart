import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppBarHeaderWidget extends StatelessWidget {
  const AppBarHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25).r,
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      // color: Colors.green,
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 191, 248, 241),
                highlightColor: AppColors.mainColor,
                child: BigText(
                  text: "Pakistan",
                  color: AppColors.mainColor,
                  size: 28.sp,
                ),
              ),
              Row(
                children: [
                  SmallText(
                    text: "Lahore",
                    color: Colors.black54,
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              )
            ],
          ),
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(15).r),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 28.r,
            ),
          ),
        ],
      ),
    );
  }
}
