import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_bar_header.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            // ==================================================
            // App Bar
            // ==================================================
            AppBarHeaderWidget(),
          ],
        ),
      ),
    );
  }
}
