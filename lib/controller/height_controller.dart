import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeightController extends GetxController {
  // Initial Value
  late RxDouble _heightofTitleContainer = 120.h.obs;

  double get height => _heightofTitleContainer.value;

  setHeight(double newHeight) {
    _heightofTitleContainer.value = newHeight.h;
  }
}
