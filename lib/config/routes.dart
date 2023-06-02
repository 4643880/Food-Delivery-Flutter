import 'package:food_delivery/login_signup_practice/screens/login_screen.dart';
import 'package:food_delivery/login_signup_practice/screens/sushi_home_screen.dart';
import 'package:food_delivery/screens/cart/cart_screen.dart';
import 'package:food_delivery/screens/food/recommended_food_details.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/screens/food/popular_food_details_screen.dart';
import 'package:food_delivery/login_signup_practice/screens/signup_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const initial = "/";
  static const routeMainFoodScreen = "/mainFoodScreen";
  static const routeHomeScreen = "/homeScreen";
  static const routePopularFoodDetials = "/popularFood";
  static const routeInternetNotAvailable = '/InternetNotAvailable';
  static const routeRecommendedFoodDetails = "/recommendFoodDetails";
  static const routeCartScreen = "/cartScreen";
  static const routeCartDetailsScreen = "/cartDetailsScreen";

  // Sushi Practice
  static const routeSignUp = "/signup";
  static const routeLogin = "/login";
  static const routeSushiHome = "/home";

  static List<GetPage> routes = [
    // ===========================
    //Shushi Practice
    // ===========================
    GetPage(
      name: RouteHelper.routeSignUp,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: RouteHelper.routeLogin,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteHelper.routeSushiHome,
      page: () => const SushiHomeScreen(),
    ),

    // Sushi Practice Ends here
    //===========================================
    GetPage(
      name: RouteHelper.initial,
      page: () => SignupScreen(),
      // page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteHelper.routeMainFoodScreen,
      page: () => SignupScreen(),
      // page: () => const MainFoodScreen(),
    ),
    GetPage(
      name: RouteHelper.routeHomeScreen,
      page: () => const HomeScreen(),
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
    // GetPage(
    //   name: RouteHelper.routeCartDetailsScreen,
    //   page: () => CartDetailsScreen(),
    //   transitionDuration: const Duration(milliseconds: 400),
    //   transition: Transition.zoom,
    //   // binding: CartBinding(),
    // ),
  ];
}
