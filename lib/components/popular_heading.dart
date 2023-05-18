import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/small_text.dart';

class PopularHeadingWidget extends StatelessWidget {
  const PopularHeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // margin: const EdgeInsets.only(top: 25).r,
      padding: const EdgeInsets.only(left: 20, right: 20).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SmallText(
                  text: "Popular",
                  size: 22.sp,
                  color: const Color(0xFF332d2b),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              SmallText(
                text: ".",
                size: 22.sp,
                color: Colors.black26,
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20).r,
                child: SmallText(
                  text: "Food Pairing",
                  size: 16.sp,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
