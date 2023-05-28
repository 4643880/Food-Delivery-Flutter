import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/screens/food/recommended_food_details.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    Future.wait(
      [
        Get.find<PopularProductController>().getPopularProductListFunc(),
        Get.find<RecommendedProductController>().getRecommendedProductListFunc()
      ],
    );
  }

  @override
  void initState() {
    // Loading APIs
    _loadResources();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
    controller.forward();
    // controller.repeat();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(RouteHelper.routeHomeScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/splash_logo.png",
                width: 280.w,
                height: 180.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo part 2.png",
              width: 280.w,
              // height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
