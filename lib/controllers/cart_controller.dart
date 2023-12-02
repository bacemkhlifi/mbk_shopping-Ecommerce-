import 'package:get/get.dart';

import '../models/product.dart';


class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
        "Product added", "You have added the ${product.title} to the cart",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  get products => _products;
  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  void clearProducts() {
    _products.clear();
  }

  void DeleteProduct(Product product) {
    _products.removeWhere((key, value) => key == product);
  }

 get productSubtotal => _products.entries
      .map((product) => product.value * product.key.price)
      .toList();

  get total => _products.entries
      .map((product) => product.value * product.key.price)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
