import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_bottom_bar_of_popular_foods_screen.dart';
import 'package:food_delivery/components/custom_title_rating_comments_section.dart';
import 'package:food_delivery/components/custom_expandable_description_text_widget.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;
import '../../components/custom_icon_button.dart';

class PopularFoodDetails extends StatelessWidget {
  Products eachProduct = Get.arguments;
  PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // devtools.log(1.sw.toString());
    // devtools.log(1.sh.toString());
    return Scaffold(
      body: LayoutBuilder(
        builder: (p0, constraints) => Stack(
          children: [
            // ==============================================================
            // Header Image
            // ==============================================================
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: constraints.maxWidth > 640 ? 1.sh / 4.50 : 1.sh / 2.50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${eachProduct.img!}"),
                  ),
                ),
              ),
            ),
            // ==============================================================
            // Icons on Image
            // ==============================================================
            Positioned(
              top: constraints.maxWidth > 640 ? 15.h : 45.h,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomIconButton(
                    icon: Icons.arrow_back_ios_new,
                    size: 50,
                    backgroundColor: AppColors.buttonBackgroundColor,
                    function: () {
                      Get.back();
                    },
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        MyCustomIconButton(
                          icon: Icons.shopping_cart_outlined,
                          backgroundColor: AppColors.buttonBackgroundColor,
                          size: 50,
                          function: () {},
                        ),
                        (controller.totalItems > 1)
                            ? Positioned(
                                top: 3,
                                right: 3,
                                child: Container(
                                  height: 20.h,
                                  width: 20.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    controller.totalItems.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.sp),
                                  ),
                                ),
                              )
                            : Positioned(
                                top: 0,
                                right: 0,
                                child: Container(),
                              ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            // ==============================================================
            // Complete Description
            // ==============================================================
            Positioned(
              left: 0.w,
              right: 0.w,
              top: constraints.maxWidth > 640 ? 1.sh / 4.50 : 1.sh / 2.75,
              bottom: 0.w,
              child: Container(
                // height: 1.sh,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 25,
                  right: 25,
                  bottom: 10,
                ).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20).r,
                    topRight: const Radius.circular(20).r,
                  ).r,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleRatingCommentsSectionWidget(
                      text: eachProduct.name!,
                    ),
                    SizedBox(
                      height: constraints.maxWidth > 640 ? 5.h : 20.h,
                    ),
                    BigText(
                      text: "Introduce",
                      size: 18.sp,
                    ),
                    SizedBox(
                      height: constraints.maxWidth > 640 ? 5.h : 20.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableDescriptionTextWidget(
                            text: eachProduct.description!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottonBarOfPopularFoodScreen(
        eachProduct: eachProduct,
      ),
    );
  }
}
