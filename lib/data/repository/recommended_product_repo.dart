import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response?> getRecommendedFoodList() async {
    Response? response = await apiClient.getData(
      "Recommended Food API",
      AppConstants.RECOMMENDED_PRODUCT_URI,
      {},
    );
    return response;
  }
}
