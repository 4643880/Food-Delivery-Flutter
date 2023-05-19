import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../helper/app_colors.dart';

class Util {
  static void showErrorSnackBar(String message) {
    //Form Closing all previous SnackBars
    // if (Get.isSnackbarOpen) {
    //   Get.closeAllSnackbars();
    // }
    Get.snackbar(
      "",
      "",
      duration: const Duration(milliseconds: 1200),
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      messageText: const SizedBox(),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 60.h, left: 16.w, right: 16.w),
      backgroundColor: AppColors.mainColor,
    );
  }
}
