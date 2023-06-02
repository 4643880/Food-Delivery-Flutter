import 'package:food_delivery/login_signup_practice/models/user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<User> getUserModel() => Hive.box<User>("hiveUserModel");
  static Box getToken() => Hive.box("hiveToken");
  static Box getIsLogin() => Hive.box("isLoginBox");
}
