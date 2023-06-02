import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/login_signup_practice/controllers/auth_controller.dart';
import 'package:food_delivery/login_signup_practice/models/user_model.dart';
import 'package:food_delivery/login_signup_practice/utils/utils.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  Rx<User> user = User(
    email: "",
    password: "",
  ).obs;
  final _key = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20).r,
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter Your Email"),
                  ),
                  validator: (value) {
                    if (value!.contains("@")) {
                      return null;
                    } else {
                      return "Please enter valid email";
                    }
                  },
                  onSaved: (newValue) {
                    user.value.email = newValue;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter Your Password"),
                  ),
                  onSaved: (newValue) {
                    user.value.password = newValue;
                  },
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Please enter valid password";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        _key.currentState!.save();
                        Utils.showLoading("Loading...");
                        final response =
                            await Get.find<AuthController>().loginApi(
                          user.value.email!,
                          user.value.password!,
                        );
                        Utils.dismiss();
                        if (response == true) {
                          Get.offAllNamed(RouteHelper.routeSushiHome);
                        }
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteHelper.routeSignUp);
                    },
                    child: const Text("Go to Signup Screen"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
