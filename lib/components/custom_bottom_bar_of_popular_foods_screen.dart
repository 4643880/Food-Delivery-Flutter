import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class BottonBarOfPopularFoodScreen extends StatelessWidget {
  final Products eachProduct;
  const BottonBarOfPopularFoodScreen({
    super.key,
    required this.eachProduct,
  });

  @override
  Widget build(BuildContext context) {
    PopularProductController myController = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15).r,
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25).r,
            topRight: const Radius.circular(25).r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Counter
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(12).r),
            ),
            child: GetBuilder<PopularProductController>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                      // print(controller.quantity);
                    },
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (controller) => SmallText(
                      text: controller.inCartQuantity.toString(),
                      color: AppColors.signColor,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                      // print(controller.quantity);
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Add to Cart Button
          GestureDetector(
            onTap: () {
              myController.addItem(eachProduct);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15).r,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(const Radius.circular(12).r),
              ),
              child: SmallText(
                text: "\$ ${eachProduct.price} Add to Cart",
                size: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
