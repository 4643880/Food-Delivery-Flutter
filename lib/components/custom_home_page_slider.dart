import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_dots_indicator.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/components/custom_title_rating_comments_section.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'dart:developer' as devtools show log;

import 'package:food_delivery/helper/dimentions.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/extra_function.dart';
import 'package:get/get.dart';

class HomePageSlider extends StatefulWidget {
  final PopularProductController controller;
  const HomePageSlider({super.key, required this.controller});

  @override
  State<HomePageSlider> createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  PageController pageController = PageController(
    viewportFraction: 0.85,
  );

  var currentPageValue = 0.0;
  var _scaleFactor = 0.8;
  double height = 220.h;

  @override
  void initState() {
    pageController.addListener(() {
      // Getting page value from controller and Assigning to Current Page Value Variable
      setState(() {
        currentPageValue = pageController.page!;
        devtools.log("Current Page Value is: ${currentPageValue.floor()}");
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ======================================================
        // Slider
        // ======================================================
        GetBuilder<PopularProductController>(
          builder: (controller) => Container(
            // color: Colors.red,
            height: 320.h,
            // color: Colors.red,
            child: widget.controller.isLoaded == false
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  )
                : PageView.builder(
                    controller: pageController,
                    itemCount: widget.controller.getPopularProductList.length,
                    itemBuilder: (context, index) {
                      final eachProduct =
                          widget.controller.getPopularProductList[index];
                      return buildPageViewMethod(
                        index: index,
                        eachProduct: eachProduct,
                      );
                    },
                  ),
          ),
        ),
        // ======================================================
        // Dots Indicator For Slider
        // ======================================================
        GetBuilder<PopularProductController>(
          builder: (controller) {
            return DotsIndicatorWidget(
              currentPageValue: currentPageValue,
              controller: controller,
            );
          },
        ),
      ],
    );
  }

  Widget buildPageViewMethod({
    required int index,
    required Products eachProduct,
  }) {
    return Transform(
      transform: sliderTransformationMethod(
        index: index,
        scaleFactor: _scaleFactor,
        currentPageValue: currentPageValue,
        height: height,
      ),
      child: InkWell(
        onTap: () {
          // Initialize the quantity of controller with zero;
          PopularProductController myController = Get.find();
          myController.initProduct(product: eachProduct);
          Get.toNamed(RouteHelper.routePopularFoodDetials,
              arguments: eachProduct);
        },
        child: Stack(
          children: [
            Container(
              height: 220.h,
              margin: const EdgeInsets.only(bottom: 60, right: 5, left: 5).r,
              decoration: BoxDecoration(
                color: index.isEven ? Colors.blue : Colors.orange,
                borderRadius: BorderRadius.circular(30).r,
                image: DecorationImage(
                  image: NetworkImage(
                      "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${eachProduct.img!}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 110.h,
                margin: EdgeInsets.only(
                  left: 25.r,
                  right: 25.r,
                  bottom: 30.r,
                ).r,
                padding: const EdgeInsets.all(8).r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20).r,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      // blurRadius: 5,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child:
                      TitleRatingCommentsSectionWidget(text: eachProduct.name!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
