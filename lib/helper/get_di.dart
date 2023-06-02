import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/login_signup_practice/controllers/auth_controller.dart';
import 'package:food_delivery/login_signup_practice/data/repository/auth_repo.dart';
import 'package:food_delivery/login_signup_practice/models/user_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  // Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // Controllers
  Get.lazyPut(
    () => PopularProductController(
      popularProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductController(
      recommendedProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => CartController(cartRepo: Get.find()),
  );

  // Shared Preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs);

  // =================================================
  // Login Signup Sushi
  // =================================================
  // Hive Start here
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter(BillingAdapter());
  await Hive.openBox("isLoginBox");
  await Hive.openBox<User>("hiveUserModel");
  await Hive.openBox("hiveToken");

  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => AuthRepo());
}
