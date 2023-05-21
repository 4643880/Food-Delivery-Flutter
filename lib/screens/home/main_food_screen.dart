import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_app_bar_header.dart';
import 'package:food_delivery/components/custom_home_page_slider.dart';
import 'package:food_delivery/components/custom_list_of_items.dart';
import 'package:food_delivery/components/custom_popular_heading.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'dart:developer' as devtools show log;

import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // devtools.log(Get.context!.height.toString());
    // devtools.log(MediaQuery.of(context).size.height.toString());
    // PopularProductController myController = Get.find();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // ==================================================
              // App Bar
              // ==================================================
              const AppBarHeaderWidget(),
              // ==================================================
              // Food Page Body
              // ==================================================
              GetBuilder<PopularProductController>(
                builder: (controller) {
                  return HomePageSlider(
                    controller: controller,
                  );
                },
              ),
              // ==================================================
              // Recommended Section
              // ==================================================
              const RecommendedHeadingWidget(),
              // ==================================================
              // List of Recommended Items
              // ==================================================
              GetBuilder<RecommendedProductController>(
                builder: (controller) =>
                    ListOfItemsWidget(controller: controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//11:32