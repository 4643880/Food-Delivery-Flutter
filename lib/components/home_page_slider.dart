import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/big_text.dart';
import 'package:food_delivery/components/dots_indicator.dart';
import 'package:food_delivery/components/icon_and_text_widget.dart';
import 'package:food_delivery/components/small_text.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'dart:developer' as devtools show log;

import 'package:food_delivery/helper/dimentions.dart';
import 'package:food_delivery/utils/extra_function.dart';

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
  double height = Dimentions.pageViewContainer.h;

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
          height: Dimentions.parentPageViewContainer,
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
      child: Stack(
        children: [
          Container(
            height: Dimentions.pageViewContainer,
            margin: const EdgeInsets.all(5).r,
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
              height: Dimentions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: 25.r,
                right: 25.r,
                bottom: 30.r,
              ).r,
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
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.r,
                  left: 15.r,
                  right: 15.r,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Chinese Side",
                      size: 22.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: 10.w,
                        ),
                        SmallText(text: "1280"),
                        SizedBox(
                          width: 10.w,
                        ),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconAndTextWidget(
                          iconData: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1,
                          text: "Normal",
                        ),
                        IconAndTextWidget(
                          iconData: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: "1.7 Km",
                        ),
                        IconAndTextWidget(
                          iconData: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor2,
                          text: "32 min",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
