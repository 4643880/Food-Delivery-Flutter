import 'package:flutter/material.dart';
import 'package:food_delivery/login_signup_practice/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SushiHomeScreen extends StatelessWidget {
  const SushiHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("HOME SCREEN"),
          ElevatedButton(
            onPressed: () {
              Get.find<AuthController>().logoutLocally();
            },
            child: const Text("Log Out"),
          ),
        ],
      )),
    );
  }
}
