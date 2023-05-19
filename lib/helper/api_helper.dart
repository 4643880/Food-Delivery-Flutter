import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_delivery/config/routes.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/controller/branch_controller.dart';
import 'package:food_delivery/utils/util.dart';
import 'dart:developer' as devtools show log;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiHelper {
  static String testingUrl = kTestUrl;

  static String kBranches = "branches";

  static Map<String, Uri> getApiUrls() {
    return <String, Uri>{kBranches: Uri.parse("$testingUrl/branches")};
  }

  static Map<String, String> defaultHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Accept-Language": "en-US",
  };

  static Map<String, String> getAuthHeader() {
    String token = Get.find<BranchController>().token.value;
    return <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Accept-Language": "en-US",
      "charset": "UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<dynamic> get({
    required String apiName,
    required Uri uri,
    Map<String, String>? header,
  }) async {
    devtools.log("Header = ${header ?? ApiHelper.defaultHeader}");
    bool internetAvailable = await internetAvailabilityCheck(false);
    if (internetAvailable) {
      try {
        http.Response response = await http.get(
          uri,
          headers: header ?? ApiHelper.defaultHeader,
        );
        devtools.log("API => Get => Link => ${uri.toString()}");
        bool responseGood = await responseIsGoodCheck(apiName, response);
        if (responseGood) {
          return jsonDecode(response.body);
        } else {
          return null;
        }
      } catch (e) {
        if (e.toString().contains("Failed host lookup")) {
          Util.showErrorSnackBar("internet_not_available".tr);
          return null;
        }
      }
    } else {
      return null;
    }
  }

  Future<dynamic> post(
    String apiName,
    Uri uri,
    Map<String, String>? header,
    Map<String, dynamic> body,
  ) async {
    log("Body = $body");
    log("Header = ${header ?? ApiHelper.defaultHeader}");
    log("Url = $uri");
    bool internetAvailable = await internetAvailabilityCheck(false);
    if (internetAvailable) {
      try {
        http.Response responseData = await http.post(
          uri,
          headers: header ?? ApiHelper.defaultHeader,
          body: jsonEncode(body),
        );
        log("API => Post => Link => ${uri.toString()}");
        bool responseGood = await responseIsGoodCheck(apiName, responseData);
        if (responseGood) {
          return jsonDecode(responseData.body);
        } else {
          return null;
        }
      } catch (e) {
        if (e.toString().contains("Failed host lookup")) {
          Util.showErrorSnackBar("No Internet available".tr);
          return null;
        }
      }
    } else {
      return null;
    }
  }

  Future<bool> responseIsGoodCheck(
      String apiName, http.Response response) async {
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
      Util.showErrorSnackBar("internet_not_available".tr);
      if (fromInternetCheckScreen == false) {
        Get.offAllNamed(routeInternetNotAvailable);
      }
      return false;
    }
  }
}
