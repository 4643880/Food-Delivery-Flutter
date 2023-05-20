import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_expandable_description_text_widget.dart';
import 'package:food_delivery/components/custom_icon_button.dart';
import 'package:get/get.dart';
import '../../components/custom_bottom_bar_of_food_details_screen.dart';
import '../../helper/app_colors.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomIconButton(
                  icon: Icons.clear,
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                child: Center(
                    child: BigText(
                  text: "Chinese Size",
                  size: 30,
                )),
              ),
            ),
            expandedHeight: 300.h,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food0.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                children: [
                  ExpandableDescriptionTextWidget(
                      text:
                          "Pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomIconButton(
                  icon: Icons.remove,
                  function: () {},
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$12.88 X 0",
                  color: Colors.black,
                  size: 20.sp,
                ),
                MyCustomIconButton(
                  icon: Icons.add,
                  function: () {},
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          const BottomBarOfFoodDetailsScreen(),
        ],
      ),
    );
  }
}
