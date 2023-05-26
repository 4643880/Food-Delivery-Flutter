import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(cartRepo: CartRepo()));
  }
}
