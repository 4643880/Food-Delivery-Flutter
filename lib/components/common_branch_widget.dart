import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/common_spacer.dart';
import 'package:food_delivery/helper/app_colors.dart';

class CommonBranchWidget extends StatelessWidget {
  final String city, address;

  const CommonBranchWidget(
      {super.key, required this.city, required this.address});
  // final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        width: 328.w,
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              // child: Image.asset(
              //   image,
              //   height: 140.h,
              //   width: 328.w,
              //   fit: BoxFit.cover,
              // ),
            ),
            VerticalSpacer(space: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              city,
                            ),
                            Text(
                              address,
                            )
                          ],
                        ),
                      ),
                      HorizontalSpacer(space: 16.w),
                      // SvgPicture.asset(
                      //   AppAssets.locationSVG,
                      //   height: 24.h,
                      //   width: 24.w,
                      // ),
                    ],
                  ),
                  VerticalSpacer(
                    space: 12.h,
                  ),
                  Container(
                    color: AppColors.mainColor,
                    height: 1.h,
                  ),
                  VerticalSpacer(
                    space: 12.h,
                  ),
                  // Row(
                  //   children: [
                  //     HomeScreenLocationInfoWidget(
                  //       icon: AppAssets.clockSVG,
                  //       onTap: (){},
                  //       text: timing,
                  //       isClosed: isClosed,
                  //     ),
                  //      HomeScreenLocationInfoWidget(
                  //       icon: AppAssets.phoneSVG,
                  //       onTap: onContactUs,
                  //       text: AppTexts.contactUs,
                  //       isClosed: false,
                  //     ),
                  //   ],
                  // ),
                  VerticalSpacer(space: 16.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
