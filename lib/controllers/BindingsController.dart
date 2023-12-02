import 'package:get/get.dart';
import 'package:mbkshopping/controllers/favorites_controller.dart';
import 'cart_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(FavoriteController());
    
  }
}