import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  RxBool isLoading = false.obs;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  @override
  Future<void> onInit() async {
    await getPopularProductListFunc().then((value) {
      if (value) {
        updateIsLoading(false);
        update();
      }
    });
    super.onInit();
  }

  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<Products> _popularProductList = [];

  List<Products> get getPopularProductList => _popularProductList;

  Future<bool> getPopularProductListFunc() async {
    // updateIsLoading(true);
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      // print("reached here");
      // print(response.body);
      // Initializing empty list
      _isLoaded = false;
      update();
      _popularProductList = [];
      final listOfProducts = ProductModel.fromJson(response.body).getProducts;
      _popularProductList.addAll(listOfProducts!);
      _isLoaded = true;
      update();
      // updateIsLoading(false);
      return true;
    } else {
      return false;
      // print("did not reach here");
      // print(response.statusCode.toString());
    }
  }

  updateIsLoading(bool newValue) {
    isLoading.value = newValue;
    update();
  }
}
