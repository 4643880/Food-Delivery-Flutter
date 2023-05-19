import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:get/get.dart';
import 'helper/helper.dart' as di;

void main() {
  runApp(const MyApp());
  di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Food Delivery',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: routeMainFoodScreen,
          getPages: Routes.routes,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
    );
  }
}

//3:54

