import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/helper/get_di.dart' as di;
import 'package:get/get.dart';

void main() {
  // it will ensure that dependencies has loaded
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        final easyLoading = EasyLoading.init();
        return GetMaterialApp(
          builder: (context, child) {
            EasyLoading.init();
            child = easyLoading(context, child);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.sp),
              child: child,
            );
          },
          title: 'Food Delivery',
          debugShowCheckedModeBanner: false,
          initialRoute: RouteHelper.initial,
          getPages: RouteHelper.routes,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}

// part 2 2:55 min
