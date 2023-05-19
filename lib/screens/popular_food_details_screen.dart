import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/components/custom_title_rating_comments_section.dart';
import 'package:food_delivery/components/custom_description_text_widget.dart';
import 'package:food_delivery/controller/height_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/helper/dimentions.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;
import '../components/custom_icon_button.dart';
import '../config/routes.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HeightController myController = Get.find();
    devtools.log(1.sw.toString());
    devtools.log(1.sh.toString());
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food0.png"),
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
                  MyCustomIconButton(
                    icon: Icons.shopping_cart_outlined,
                    backgroundColor: AppColors.buttonBackgroundColor,
                    size: 50,
                    function: () {},
                  ),
                ],
              ),
            ),
            // ==============================================================
            // Icons on Image
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
                child: SingleChildScrollView(
                  physics: constraints.maxWidth > 640
                      ? const AlwaysScrollableScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleRatingCommentsSectionWidget(
                        text: "Chinese Side",
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
                      Obx(
                        () => AnimatedContainer(
                          alignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          height: myController.height,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)).r,
                            color: AppColors.buttonBackgroundColor,
                          ),
                          child: DescriptionTextWidget(
                              text:
                                  "Pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 1.sh / 8.69,
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12).r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SmallText(
                    text: "0",
                    color: AppColors.signColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(const Radius.circular(12).r),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 25).r,
                child: SmallText(
                  text: "\$0.08 Add to Cart",
                  size: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
