import 'package:get/get.dart';

class Dimentions {
  // Getx keeps the context everywhere that's why not using media query
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 803/120 => 3.65
  static double parentPageViewContainer = screenHeight / 2.50;
  static double pageViewContainer = screenHeight / 3.65;
  static double pageViewTextContainer = screenHeight / 6.69;
}
