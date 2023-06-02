import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/util.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;

class ApiClient extends GetConnect implements GetxService {
  String? token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}) {
    print(appBaseUrl);
    baseUrl = appBaseUrl;
    // timeout means how long a request should try
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;

    _mainHeader = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
      "charset": "UTF-8",
    };
  }

  // Future<Response> getData(String uri) async {
  //   try {
  //     Response response = await get(uri);
  //     return response;
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: e.toString());
  //   }
  // }

  Future<dynamic> getData(
    String apiName,
    String uri,
    Map<String, String>? header,
  ) async {
    bool internetAvailable = await internetAvailabilityCheck(false);
    if (internetAvailable) {
      try {
        Response response = await get(uri);

        devtools.log("API => Get => Link => ${uri.toString()}");
        bool responseGood = await responseIsGoodCheck(apiName, response);
        if (responseGood) {
          // return jsonDecode(response.body);
          return response;
        } else {
          return null;
        }
      } catch (e) {
        if (e.toString().contains("Failed host lookup")) {
          Utils.showErrorSnackBar("internet_not_available".tr);
          return null;
        }
      }
    } else {
      return null;
    }
  }

  Future<bool> responseIsGoodCheck(String apiName, Response response) async {
    if (response.statusCode == 404) {
      log("********* Response 404 *********");
      log(apiName);
      log("404==>> ${response.body}.");
      return false;
    } else if (response.statusCode == 422) {
      log("********* Response 422 *********");
      log(apiName);
      log("422=>> ${response.body}.");
      return true;
    } else if (response.statusCode == 400) {
      log("********* Response 400 *********");
      log(apiName);
      // log("${response.body}.");
      return true;
    } else if (response.statusCode == 403) {
      log("********* Response 403 *********");
      log(apiName);
      // log("${response.body}.");
      return true;
    } else if (response.statusCode == 401) {
      log("********* Response 401 *********");
      log(apiName);
      // // log("${response.body}.");
      // await Get.find<AuthController>().logoutLocally();
      // Get.offAllNamed(routeSplash);
      return true;
    } else if (response.statusCode == 200) {
      log("********* Response Is Good *********");
      log(apiName);
      // log("${response.body}.");
      return true;
    } else if (response.statusCode == 202) {
      log("********* Response Is Good *********");
      log(apiName);
      // // log("${response.body}.");
      return true;
    } else {
      log("********* Response ${response.statusCode} UnConfigure *********");
      log(apiName);
      // // log("${response.body}.");
      return false;
    }
  }

  Future<bool> internetAvailabilityCheck(bool fromInternetCheckScreen) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      Utils.showErrorSnackBar("Internet Not Available".tr);
      if (fromInternetCheckScreen == false) {
        Get.offAllNamed(RouteHelper.initial);
      }
      return false;
    }
  }
}
