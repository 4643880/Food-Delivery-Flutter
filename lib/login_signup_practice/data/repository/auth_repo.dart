import 'package:food_delivery/login_signup_practice/constants.dart';
import 'package:food_delivery/login_signup_practice/data/api/api.dart';

class AuthRepo {
  Future<dynamic> createAccount(
    String name,
    String email,
    String password,
  ) async {
    dynamic dynamicData = await ApiHelper().postData(
      "createAccountRepo",
      ApiHelper.getApiUrls()[ApiHelper.kSignUp]!,
      ApiHelper.defaultHeader,
      <String, dynamic>{
        "user_email": email,
        "user_login": name,
        "user_pass": password,
        "user_nicename": name,
        "display_name": name,
        "phone": "",
        "first_name": "",
        "last_name": ""
      },
    );
    return dynamicData;
  }

  Future<dynamic> userLogin(String email, String password) async {
    dynamic dynamicData = await ApiHelper().postData(
      "createAccountRepo",
      ApiHelper.getApiUrls()[ApiHelper.kLogin]!,
      ApiHelper.defaultHeader,
      <String, dynamic>{
        "seconds": cookieLifeTime,
        "username": email,
        "password": password,
      },
    );
    return dynamicData;
  }
}
