import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class ListOfItemsWidget extends StatelessWidget {
  final RecommendedProductController controller;
  const ListOfItemsWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return controller.isLoaded == false
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          )
        : Container(
            // height: 108.h * 10,
            // color: Colors.red,
            padding: const EdgeInsets.only(left: 15, right: 15).r,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getRecommendedProductList.length,
              itemBuilder: (context, index) {
                final eachProduct = controller.getRecommendedProductList[index];
                return Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: 6, horizontal: 0)
                              .r,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(20).r),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            RouteHelper.routeRecommendedFoodDetails,
                            arguments: eachProduct,
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              // padding: EdgeInsets.only(top: 10.r, bottom: 5.r),
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color:
                                    index.isEven ? Colors.orange : Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${eachProduct.img!}")),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0).r,
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  // padding: EdgeInsets,
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: eachProduct.name!,
                                          size: 16.sp,
                                        ),
                                        BigText(
                                          text: eachProduct.description!,
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
                                              iconData:
                                                  Icons.access_time_rounded,
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
