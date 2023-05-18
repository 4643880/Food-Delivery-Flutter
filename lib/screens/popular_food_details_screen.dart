import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helper/dimentions.dart';
import 'package:get/get.dart';

import '../components/custom_icon_button.dart';
import '../config/routes.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ==============================================================
          // Header Image
          // ==============================================================
          Container(
            height: Dimentions.headerImage,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food0.png"),
              ),
            ),
          ),
          // ==============================================================
          // Icons on Image
          // ==============================================================
          Positioned(
            top: 45.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCustomIconButton(
                  icon: Icons.arrow_back_ios,
                  size: 50,
                  function: () {
                    Get.toNamed(routeMainFoodScreen);
                  },
                ),
                MyCustomIconButton(
                  icon: Icons.shopping_cart_outlined,
                  size: 50,
                  function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
