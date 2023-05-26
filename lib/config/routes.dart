import 'package:food_delivery/helper/bindings.dart';
import 'package:food_delivery/screens/cart/cart_details_screen.dart';
import 'package:food_delivery/screens/cart/cart_screen.dart';
import 'package:food_delivery/screens/food/recommended_food_details.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/screens/food/popular_food_details_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const initial = "/";
  static const routeMainFoodScreen = "/mainFoodScreen";
  static const routePopularFoodDetials = "/popularFood";
  static const routeInternetNotAvailable = '/InternetNotAvailable';
  static const routeRecommendedFoodDetails = "/recommendFoodDetails";
  static const routeCartScreen = "/cartScreen";
  static const routeCartDetailsScreen = "/cartDetailsScreen";

  static List<GetPage> routes = [
    GetPage(
      name: RouteHelper.initial,
      // page: () => ResponsiveView(),
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: RouteHelper.routeMainFoodScreen,
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: RouteHelper.routePopularFoodDetials,
      page: () => PopularFoodDetails(),
    ),
    GetPage(
      name: RouteHelper.routeRecommendedFoodDetails,
      page: () => RecommendedFoodDetails(),
      transitionDuration: const Duration(milliseconds: 400),
      transition: Transition.zoom,
    ),
    GetPage(
      name: RouteHelper.routeCartScreen,
      page: () => const CartScreen(),
      transitionDuration: const Duration(milliseconds: 400),
      transition: Transition.zoom,
    ),
    GetPage(
      name: RouteHelper.routeCartDetailsScreen,
      page: () => CartDetailsScreen(),
      transitionDuration: const Duration(milliseconds: 400),
      transition: Transition.zoom,
      // binding: CartBinding(),
    ),
  ];
}
