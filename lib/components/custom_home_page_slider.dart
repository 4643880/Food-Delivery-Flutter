import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_dots_indicator.dart';
import 'package:food_delivery/components/custom_icon_and_text_widget.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/components/custom_title_rating_comments_section.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'dart:developer' as devtools show log;

import 'package:food_delivery/helper/dimentions.dart';
import 'package:food_delivery/utils/extra_function.dart';
import 'package:get/get.dart';

class HomePageSlider extends StatefulWidget {
  const HomePageSlider({super.key});

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
        Container(
          // color: Colors.red,
          height: 250.h,
          // color: Colors.red,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return buildPageViewMethod(index);
            },
          ),
        ),
        // ======================================================
        // Dots Indicator For Slider
        // ======================================================
        DotsIndicatorWidget(currentPageValue: currentPageValue),
      ],
    );
  }

  Widget buildPageViewMethod(int index) {
    return Transform(
      transform: sliderTransformationMethod(
        index: index,
        scaleFactor: _scaleFactor,
        currentPageValue: currentPageValue,
        height: height,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(routePopularFoodDetials);
        },
        child: Stack(
          children: [
            Container(
              height: 180.h,
              margin: const EdgeInsets.only(bottom: 60, right: 5, left: 5).r,
              decoration: BoxDecoration(
                color: index.isEven ? Colors.blue : Colors.orange,
                borderRadius: BorderRadius.circular(30).r,
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/food0.png",
                  ),
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
                child: const SingleChildScrollView(
                  child: TitleRatingCommentsSectionWidget(text: "Chinese Side"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
