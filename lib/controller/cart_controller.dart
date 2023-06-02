import 'package:flutter/material.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';
import 'dart:developer' as devtools show log;

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  // Stored Items in Shared Prefs
  List<CartModel> storedItems = [];

  // Using this in the initProduct Function
  bool existInCart({required Products product}) {
    if (_items.containsKey(product.id)) {
      devtools.log("Item Exists");
      return true;
    } else {
      devtools.log("Item Does not Exists");
      return false;
    }
  }

  // Using this in the initProduct Function
  int getQuantity({required Products product}) {
    int tempQuantitiy = 0;
    if (_items.containsKey(product.id)) {
      items.forEach((key, value) {
        if (key == product.id) {
          tempQuantitiy = value.quantity!;
          // update();
          Future.delayed(const Duration(milliseconds: 20), () {
            update();
          });
        }
      });
    }
    return tempQuantitiy;
  }

  addItem(Products product, int quantity) {
    int totalQuantity = 0;
    // Log Messages
    // devtools.log("product quantity is $quantity");
    // items.forEach((key, value) {
    //   print(value.quantity.toString());
    //   print(value.name.toString());
    // });

    // checking that is map already contains product or not
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        // devtools.log(
        //   "Updated Item to the Cart Quantity is: $quantity Product Name is: ${product.name}",
        // );
        totalQuantity = (value.quantity! + quantity);

        return CartModel(
          id: value.id, // old id
          name: value.name, // old name
          price: value.price, // old price
          img: value.img, // old img
          quantity: value.quantity! + quantity, // old quantity + new quantity
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
        Get.snackbar(
          "Item Deleted",
          "Item has deleted successfully from the cart!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }

      // update();
      Future.delayed(const Duration(milliseconds: 20), () {
        update();
      });
    } else {
      // Adding Items in Map
      // Each product has unique id because it's primary key
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            // devtools.log(
            //   "Added Item to the Cart Quantity is: $quantity Product Name is: ${product.name}",
            // );
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      }
      // update();
      Future.delayed(const Duration(milliseconds: 20), () {
        update();
      });
    }

    // Saving list into Shared Prefs
    Get.find<CartRepo>().addToCartList(getListOfCart);

    // Log Message
    // devtools.log("length is Items Map is ${_items.length}");
  }

  // Getting quantity of all items that are in Cart list
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getListOfCart {
    // Sample 1
    List<CartModel> myListOfCart = [];
    _items.forEach((key, value) {
      myListOfCart.add(value);
    });
    return myListOfCart;

    // Sample 2
    // _items.entries.map((e) {
    //   return e.value;
    // }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      final quantity = value.quantity;
      final price = value.price;
      total += quantity! * price!;
    });
    return total;
  }

  // Getting Data From Shared Prefs and Assigning to _items list of Controller
  List<CartModel> getCartData() {
    final result = Get.find<CartRepo>().getCartList();
    setCart = result;
    return storedItems;
  }

  set setCart(List<CartModel> items) {
    storedItems = items;

    for (int i = 0; i < storedItems.length; i++) {
      // This will put information, when we'll start the app and in the beginning _items will be empty
      _items.putIfAbsent(
        storedItems[i].product!.id!,
        () {
          return storedItems[i];
        },
      );
    }
  }
}
