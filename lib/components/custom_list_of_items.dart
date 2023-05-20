import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:get/get.dart';

class ListOfItemsWidget extends StatelessWidget {
  const ListOfItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h * 10,
      padding: const EdgeInsets.only(left: 17, right: 17).r,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(routeRecommendedFoodDetails);
                  },
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(top: 10.r, bottom: 5.r),
                        width: 100.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.orange : Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/food0.png",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Container(
                            width: 80.w,
                            height: 80.h,
                            // padding: EdgeInsets,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: "Nutritious Fruit Meal in china",
                                  size: 16.sp,
                                ),
                                BigText(
                                  text:
                                      "With Cheese Characteristics Nutritious Fruit Meal",
                                  size: 10.sp,
                                  color: Colors.black26,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
