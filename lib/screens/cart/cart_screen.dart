import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_big_text.dart';
import 'package:food_delivery/components/custom_icon_button.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartController>(
        builder: (controller) => Stack(
          children: [
            // ===================================================
            // Buttons
            // ===================================================
            Positioned(
              top: 60.h,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomIconButton(
                    icon: Icons.arrow_back_ios_new,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    size: 50,
                    function: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 150.w,
                  ),
                  MyCustomIconButton(
                    icon: Icons.home,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    size: 50,
                    function: () {
                      Get.toNamed(RouteHelper.routeMainFoodScreen);
                    },
                  ),
                  Stack(
                    children: [
                      MyCustomIconButton(
                        icon: Icons.shopping_cart_outlined,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        size: 50,
                        function: () {
                          Get.toNamed(RouteHelper.routeCartScreen);
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  controller.totalItems.toString(),
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              top: 0,
                              right: 0,
                              child: Container(),
                            ),
                    ],
                  ),
                ],
              ),
            ),

            // ===================================================
            // List View Items
            // ===================================================

            Positioned(
              top: 130.h,
              left: 20.w,
              right: 20.w,
              bottom: 0,
              child: Container(
                // color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.getListOfCart.length,
                    itemBuilder: (context, index) {
                      final eachItem = controller.getListOfCart[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RouteHelper.routeCartDetailsScreen,
                            arguments: eachItem.product,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10).r,
                          height: 100.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              // color: Colors.orange,
                              borderRadius: BorderRadius.circular(20).r),
                          child: Row(
                            children: [
                              Container(
                                height: 100.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                    // color: Colors.green,
                                    borderRadius: BorderRadius.circular(20).r,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        AppConstants.BASE_URL +
                                            AppConstants.UPLOAD_URL +
                                            eachItem.img!,
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      BigText(
                                        text: eachItem.name.toString(),
                                        color: AppColors.mainBlackColor,
                                        size: 25.sp,
                                      ),
                                      BigText(
                                        text: "Spicy",
                                        color: AppColors.textColor,
                                        size: 12.sp,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                "\$ ${eachItem.price! * eachItem.quantity!}",
                                            color: Colors.red,
                                            size: 12.sp,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.addItem(
                                                    eachItem.product!,
                                                    -1,
                                                  );
                                                  // controller.setQuantity(false);
                                                  // print(controller.quantity);
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: AppColors.signColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SmallText(
                                                text: eachItem.quantity
                                                    .toString(),
                                                color: AppColors.mainBlackColor,
                                                size: 18.sp,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.addItem(
                                                    eachItem.product!,
                                                    1,
                                                  );
                                                  // controller.setQuantity(true);
                                                  // print(controller.quantity);
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: AppColors.signColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
