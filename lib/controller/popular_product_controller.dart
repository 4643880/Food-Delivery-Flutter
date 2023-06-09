import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';
import 'dart:developer' as devtools show log;
import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController implements GetxService {
  RxBool isLoading = false.obs;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<Products> _popularProductList = [];
  List<Products> get getPopularProductList => _popularProductList;

  // Quantity
  int _quantity = 1;
  int get quantity => _quantity;
  int _inCartQuantity = 0;

  // will return old inCartQuantity + new quantity
  int get inCartQuantity => _inCartQuantity + _quantity;
  // CartController myCartController = Get.find();

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

  // API Implementation
  Future<bool> getPopularProductListFunc() async {
    // updateIsLoading(true);
    Response? response = await popularProductRepo.getPopularProductList();

    if (response?.statusCode == 200) {
      // print("reached here");
      // print(response.body);
      // Initializing empty list
      _isLoaded = false;
      update();
      _popularProductList = [];
      final listOfProducts = ProductModel.fromJson(response?.body).getProducts;
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

      if (_inCartQuantity > 0) {
        _quantity = -_inCartQuantity;
      }
      return _quantity;
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
