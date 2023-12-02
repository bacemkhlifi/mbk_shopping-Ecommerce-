import 'package:get/get.dart';

import '../models/product.dart';

class FavoriteController extends GetxController {
  var _favoriteProducts = <Product>[].obs;

  void addToFavorites(Product product) {
    _favoriteProducts.add(product);
    update(); // Notify listeners that the state has changed
  }

  void removeFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    update(); // Notify listeners that the state has changed
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }

  List<Product> get favoriteProducts => _favoriteProducts;
}
