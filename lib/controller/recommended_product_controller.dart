import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  RxBool isLoading = false.obs;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  @override
  Future<void> onInit() async {
    await getRecommendedProductListFunc().then((value) {
      if (value) {
        updateIsLoading(false);
        update();
      }
    });
    super.onInit();
  }

  List<Products> _recommendedProductList = [];

  List<Products> get getRecommendedProductList => _recommendedProductList;

  Future<bool> getRecommendedProductListFunc() async {
    // updateIsLoading(true);
    Response response = await recommendedProductRepo.getRecommendedFoodList();

    if (response.statusCode == 200) {
      print("reached here");
      print(response.body);
      // Initializing empty list
      _isLoaded = false;
      update();
      _recommendedProductList = [];
      final listOfProducts = ProductModel.fromJson(response.body).getProducts;
      _recommendedProductList.addAll(listOfProducts!);
      _isLoaded = true;
      update();
      // updateIsLoading(false);
      return true;
    } else {
      return false;
      print("did not reach here");
      print(response.statusCode.toString());
    }
  }

  updateIsLoading(bool newValue) {
    isLoading.value = newValue;
    update();
  }
}
