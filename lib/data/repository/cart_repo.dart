import 'dart:convert';

import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  // =================================================
  // Adding Into Shared Prefs
  // =================================================
  void addToCartList(List<CartModel> cartModelList) async {
    // Assigning Empty List
    cart = [];
    cartModelList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    // Saving into shared preferences.
    await sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  // =================================================
  // Fetching Data from Shared Prefs
  // =================================================
  List<CartModel> getCartList() {
    print("Inside Get Cart List Function");
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      // Getting List of Strings from shared prefs
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }
    // Creating Empty list
    List<CartModel> cartList = [];

    // Assigning values after decoding
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartList;
  }
}
