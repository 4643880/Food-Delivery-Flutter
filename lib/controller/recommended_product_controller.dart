import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  RxBool isLoading = false.obs;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // Quantity
  int _quantity = 1;
  int get quantity => _quantity;
  int _inCartQuantity = 0;

  // will return old inCartQuantity + new quantity
  int get inCartQuantity => _inCartQuantity + _quantity;

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

  // Implementatino of API
  Future<bool> getRecommendedProductListFunc() async {
    // updateIsLoading(true);
    Response? response = await recommendedProductRepo.getRecommendedFoodList();

    if (response?.statusCode == 200) {
      // print("reached here");
      // print(response.body);
      // Initializing empty list
      _isLoaded = false;
      update();
      _recommendedProductList = [];
      final listOfProducts = ProductModel.fromJson(response?.body).getProducts;
      _recommendedProductList.addAll(listOfProducts!);
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

  // Most Important Function using this during the navigation to next page
  // Whenever will go to next page through inkwell, first will call this method then navigate
  void initProduct({required Products product}) {
    final result = Get.find<CartController>().existInCart(product: product);
    if (result == true) {
      // Assigning new value to _quantity variable
      // Assigning new value to _inCartQuantity variable
      _quantity = 0;
      _inCartQuantity =
          Get.find<CartController>().getQuantity(product: product);
      update();
    } else {
      // Assigning new value to _quantity variable
      // Assigning new value to _inCartQuantity variable
      _quantity = 0;
      _inCartQuantity = 0;
      update();
    }
  }

  // Quantity is increasing and decreasing in this page
  void addItem(Products product) {
    // Adding Quantity in the Cart
    Get.find<CartController>().addItem(product, _quantity);

    // assigning new value to _quantity variable
    // Assigning new value to _inCartQuantity variable
    _quantity = 0;
    _inCartQuantity = Get.find<CartController>().getQuantity(product: product);
    update();
    // Log Message
    Get.find<CartController>().items.forEach((key, value) {
      devtools.log(
        "Id is: " +
            value.id.toString() +
            " Quantity is: " +
            value.quantity.toString(),
      );
    });
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement == true) {
      _quantity = checkQuantity(_quantity + 1);
      update();
      devtools.log(_quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      update();
      log((_quantity).toString());
    }
  }

  int checkQuantity(int quantity) {
    if ((_inCartQuantity + quantity) < 0) {
      Get.snackbar(
        "Item Count",
        "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      // assigning new value to _quantity variable
      // Assigning new value to _inCartQuantity variable
      _quantity = 0;
      _inCartQuantity = 0;
      return 0;
    } else if ((_inCartQuantity + quantity) > 20) {
      Get.snackbar(
        "Item Count",
        "You can't Increase more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  int get totalItems {
    return Get.find<CartController>().totalItems;
  }

  List<CartModel> get listOfCartItems {
    return Get.find<CartController>().getListOfCart;
  }

  updateIsLoading(bool newValue) {
    isLoading.value = newValue;
    update();
  }
}
