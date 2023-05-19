import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/helper/app_colors.dart';

class TitleRatingCommentsSectionWidget extends StatelessWidget {
  final String text;

  const TitleRatingCommentsSectionWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: 26.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15.w,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: 10.w,
            ),
            SmallText(text: "1280"),
            SizedBox(
              width: 10.w,
            ),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
              iconData: Icons.circle_sharp,
              iconColor: AppColors.iconColor1,
              text: "Normal",
            ),
            IconAndTextWidget(
              iconData: Icons.location_on,
              iconColor: AppColors.mainColor,
              text: "1.7 Km",
            ),
            IconAndTextWidget(
              iconData: Icons.access_time_rounded,
              iconColor: AppColors.iconColor2,
              text: "32 min",
            ),
          ],
        ),
      ],
    );
  }
}
