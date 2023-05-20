import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get getPopularProductList => _popularProductList;

  Future<void> getPopularProductListFunc() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      // Initializing empty list
      _popularProductList = [];
      _popularProductList.addAll([1, 2, 3]);
      update();
    } else {}
  }
}
