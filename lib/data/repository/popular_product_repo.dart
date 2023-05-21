import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    // providing end-point because I already have give base url in dependencies
    Response response = await apiClient.getData(
      AppConstants.POPULAR_PRODUCT_URI,
    );
    // print("/api/v1/products/popular");
    return response;
  }
}
