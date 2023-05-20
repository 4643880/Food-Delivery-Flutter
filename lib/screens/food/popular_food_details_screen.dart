import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_bottom_bar_of_popular_foods_screen.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/components/custom_title_rating_comments_section.dart';
import 'package:food_delivery/components/custom_expandable_description_text_widget.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/helper/dimentions.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;
import '../../components/custom_icon_button.dart';
import '../../config/routes.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableDescriptionTextWidget(
                            text:
                                "Pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
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
      bottomNavigationBar: const BottonBarOfPopularFoodScreen(),
    );
  }
}
