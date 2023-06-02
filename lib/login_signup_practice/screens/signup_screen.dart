import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/helper/hive_boxes.dart';
import 'package:food_delivery/login_signup_practice/controllers/auth_controller.dart';
import 'package:food_delivery/login_signup_practice/models/user_model.dart';
import 'package:food_delivery/login_signup_practice/utils/app_texts.dart';
import 'package:food_delivery/login_signup_practice/utils/utils.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  final _key = GlobalKey<FormState>();
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Rx<User> user = User().obs;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(
        const Duration(seconds: 1),
        () async {
          final box = Boxes.getIsLogin();
          final response = box.get(AppTexts.hiveIsLoginKey);
          if (response) {
            await Get.offAllNamed(RouteHelper.routeSushiHome);
          }
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20).r,
          child: Form(
            key: widget._key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter Your Email"),
                  ),
                  onSaved: (value) {
                    user.value.email = value;
                  },
                  validator: (value) {
                    if (value!.contains("@")) {
                      return null;
                    } else {
                      return "Please enter valid email";
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter Your Username or User Login"),
                  ),
                  onSaved: (newValue) {
                    user.value.username = newValue;
                  },
                  validator: (value) {
                    if (value!.length < 2 || value.isEmpty) {
                      return "Please enter valid name";
                    } else {
                      return null;
                    }
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
                    if (value!.length < 8 || value.isEmpty) {
                      return "Please enter valid password";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Enter Your Nice Name"),
                  ),
                  onSaved: (newValue) {
                    user.value.nicename = newValue;
                  },
                  validator: (value) {
                    if (value!.length < 2 || value.isEmpty) {
                      return "Please enter valid name";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (widget._key.currentState!.validate()) {
                        widget._key.currentState!.save();
                        Utils.showLoading("Loading...");
                        final response =
                            await Get.find<AuthController>().createUser(
                          user.value.username!,
                          user.value.email!,
                          user.value.password!,
                        );
                        Utils.dismiss();
                        if (response == true) {
                          Get.offNamed(RouteHelper.routeSushiHome);
                        }
                      }
                    },
                    child: const Text("Register"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteHelper.routeLogin);
                    },
                    child: const Text("Go to Login Screen"),
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
