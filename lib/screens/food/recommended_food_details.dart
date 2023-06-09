import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_expandable_description_text_widget.dart';
import 'package:food_delivery/components/custom_icon_button.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../../components/custom_bottom_bar_of_food_details_screen.dart';
import '../../helper/app_colors.dart';

class RecommendedFoodDetails extends StatelessWidget {
  RecommendedFoodDetails({
    super.key,
  });

  Products eachProduct = Get.arguments;

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
                GetBuilder<RecommendedProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      MyCustomIconButton(
                        icon: Icons.shopping_cart_outlined,
                        backgroundColor: AppColors.buttonBackgroundColor,
                        size: 50,
                        function: () {
                          if (controller.totalItems > 0) {
                            Get.toNamed(RouteHelper.routeCartScreen);
                          }
                        },
                      ),
                      (controller.totalItems > 0)
                          ? Positioned(
                              top: 3,
                              right: 3,
                              child: Container(
                                height: 20.h,
                                width: 20.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  controller.totalItems.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11.sp),
                                ),
                              ),
                            )
                          : Positioned(
                              top: 0,
                              right: 0,
                              child: Container(),
                            ),
                    ],
                  );
                }),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: BigText(
                    text: eachProduct.name!,
                    size: 30,
                  )),
                ),
              ),
            ),
            expandedHeight: 300.h,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${eachProduct.img!}",
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
                    text: eachProduct.description!,
                  ),
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
                GetBuilder<RecommendedProductController>(
                  builder: (controller) => MyCustomIconButton(
                    icon: Icons.remove,
                    function: () {
                      controller.setQuantity(false);
                    },
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ),
                GetBuilder<RecommendedProductController>(
                  builder: (controller) => BigText(
                    text:
                        "\$ ${eachProduct.price} X ${controller.inCartQuantity}",
                    color: Colors.black,
                    size: 20.sp,
                  ),
                ),
                GetBuilder<RecommendedProductController>(
                  builder: (controller) => MyCustomIconButton(
                    icon: Icons.add,
                    function: () {
                      controller.setQuantity(true);
                    },
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          BottomBarOfFoodDetailsScreen(eachProduct: eachProduct),
        ],
      ),
    );
  }
}
