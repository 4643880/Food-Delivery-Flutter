import 'package:food_delivery/screens/main_food_screen.dart';
import 'package:food_delivery/screens/popular_food_details_screen.dart';
import 'package:get/get.dart';

import '../screens/branches.dart';

const routeMainFoodScreen = "/mainFoodScreen";
const routePopularFoodDetials = "/popularFood";
const routeInternetNotAvailable = '/InternetNotAvailable';
const routeBranches = '/branches';

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
      name: routeBranches,
      page: () => const BranchesScreen(),
    ),
  ];
}
