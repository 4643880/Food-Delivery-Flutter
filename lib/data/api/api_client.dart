import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

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

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
