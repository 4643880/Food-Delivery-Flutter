import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Utils {
  static void showErrorSnackBar(String message) {
    Get.snackbar(
      "",
      "",
      duration: const Duration(milliseconds: 1200),
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      messageText: const SizedBox(),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 40.h, left: 16.w, right: 16.w),
      backgroundColor: Colors.greenAccent,
    );
  }

  static void showLoading(String message) {
    EasyLoading.show(
      status: message,
      // indicator: EasyLoadingIndicatorType.fadingCircle,
      // indicator: const CircularProgressIndicator.adaptive(
      //   backgroundColor: Colors.black,
      // ),
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.clear,
    );
  }

  static void setEasyLoading() {
    EasyLoading.instance
      ..textColor = Colors.white
      ..indicatorSize = 22.w
      ..indicatorColor = Colors.amber
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..userInteractions = false
      ..dismissOnTap = false
      ..backgroundColor = Colors.black
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..animationDuration = const Duration(milliseconds: 400);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
