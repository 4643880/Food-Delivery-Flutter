import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/custom_small_text.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/models/product_model.dart';

class BottomBarOfFoodDetailsScreen extends StatelessWidget {
  final Products eachProduct;

  const BottomBarOfFoodDetailsScreen({
    super.key,
    required this.eachProduct,
  });

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2).r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(12).r),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              ),
            ),
          ),

          // Add to Cart Button
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15).r,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.all(const Radius.circular(12).r),
            ),
            child: SmallText(
              text: "\$ ${eachProduct.price}  |  Add to Cart",
              size: 15.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
