import 'package:food_delivery/screens/food/recommended_food_details.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/screens/food/popular_food_details_screen.dart';
import 'package:get/get.dart';

const routeMainFoodScreen = "/mainFoodScreen";
const routePopularFoodDetials = "/popularFood";
const routeInternetNotAvailable = '/InternetNotAvailable';
const routeRecommendedFoodDetails = "/recommendFoodDetails";

class Routes {
  static final routes = [
    GetPage(
      name: routeMainFoodScreen,
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: routePopularFoodDetials,
      page: () => const PopularFoodDetails(),
    ),
    GetPage(
      name: routeRecommendedFoodDetails,
      page: () => const RecommendedFoodDetails(),
    ),
  ];
}
