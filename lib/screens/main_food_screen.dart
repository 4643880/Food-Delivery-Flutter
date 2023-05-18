import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/app_bar_header.dart';
import 'package:food_delivery/components/home_page_slider.dart';
import 'package:food_delivery/components/list_of_items.dart';
import 'package:food_delivery/components/popular_heading.dart';
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
    devtools.log(MediaQuery.of(context).size.height.toString());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: const [
              // ==================================================
              // App Bar
              // ==================================================
              AppBarHeaderWidget(),
              // ==================================================
              // Food Page Body
              // ==================================================
              HomePageSlider(),
              // ==================================================
              // Popular Section
              // ==================================================
              PopularHeadingWidget(),
              // ==================================================
              // List of Items
              // ==================================================
              ListOfItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}



//11:32