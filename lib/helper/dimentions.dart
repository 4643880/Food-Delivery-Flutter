import 'package:get/get.dart';

class Dimentions {
  // Getx keeps the context everywhere that's why not using media query
  // Formula: check screen hight with media query then divide it , 803/120 => 3.65
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double parentPageViewContainer = screenHeight / 2.50;
  static double pageViewContainer = screenHeight / 3.65;
  static double pageViewTextContainer = screenHeight / 6.69;

  // Popular Food Details Screen
  static double headerImage = screenHeight / 2.30;
}
