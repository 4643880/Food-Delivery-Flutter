import 'package:flutter/foundation.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/helper/hive_boxes.dart';
import 'package:food_delivery/login_signup_practice/data/repository/auth_repo.dart';
import 'package:food_delivery/login_signup_practice/models/user_model.dart';
import 'package:food_delivery/login_signup_practice/utils/app_texts.dart';
import 'package:food_delivery/login_signup_practice/utils/utils.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  RxString token = "".obs;
  RxBool isLogin = false.obs;
  RxBool isGuest = false.obs;
  Rx<User> userModel = User().obs;

  Future<bool> createUser(String name, String email, String password) async {
    try {
      dynamic check = await AuthRepo().createAccount(name, email, password);
      if (check != null) {
        if (check['status_code'] == 200 || check['status_code'] == true) {
          Utils.showErrorSnackBar("Signup successful");
          UserModel tempUser = UserModel.fromJson(check);
          await loginAsUserLocally(tempUser.user!, check['cookie']);
          update();
          return true;
        } else {
          Utils.showErrorSnackBar("Something went wrong");
        }
      }
      update();
      return false;
    } catch (e) {
      if (kDebugMode) {
        print("Exception in createAccountWithEmailApi = $e");
      }
      update();
      return false;
    }
  }

  Future<bool> loginApi(String email, String password) async {
    try {
      dynamic check = await AuthRepo().userLogin(email, password);
      if (check != null) {
        if (check['status_code'] == 200) {
          Utils.showErrorSnackBar("Login successful");
          UserModel tempUser = UserModel.fromJson(check);
          await loginAsUserLocally(tempUser.user!, check['cookie']);
          update();
          return true;
        } else {
          Utils.showErrorSnackBar(check['message']);
          return false;
        }
      }
      update();
      return false;
    } catch (e) {
      if (kDebugMode) {
        print("Exception in loginApi = $e");
      }
      Utils.dismiss();
      update();
      return false;
    }
  }

  Future<void> loginAsUserLocally(
    User user,
    String tempToken,
  ) async {
    await saveLoginUserInHive(user, tempToken);

    isLogin.value = true;
    isGuest.value = false;
    updateLocalValues(user, tempToken);
    update();
  }

  Future<void> logoutLocally() async {
    final userModelBox = Boxes.getUserModel();
    final isLoginVar = Boxes.getIsLogin();
    final tokenBox = Boxes.getToken();

    await userModelBox.put(AppTexts.hiveUserModel, User());
    await isLoginVar.put(AppTexts.hiveIsLoginKey, false);
    await tokenBox.put(AppTexts.hiveToken, "");

    isLogin.value = false;
    token.value = "";
    Get.back();
    Get.offAllNamed(RouteHelper.routeSignUp);
    changeUserModel(User());
    update();
  }

  Future<void> saveLoginUserInHive(
    User userModel,
    String tempToken,
  ) async {
    final userModelBox = Boxes.getUserModel();
    final tokenBox = Boxes.getToken();
    final isLogin = Boxes.getIsLogin();

    await userModelBox.put(AppTexts.hiveUserModel, userModel);
    await tokenBox.put(AppTexts.hiveToken, tempToken);
    await isLogin.put(AppTexts.hiveIsLoginKey, true);
  }

  void updateLocalValues(
    User user,
    String tempToken,
  ) {
    token.value = tempToken;
    changeUserModel(userModel.value);
  }

  void changeUserModel(User tempUserModel) {
    userModel.value = tempUserModel;
    update();
  }
}
