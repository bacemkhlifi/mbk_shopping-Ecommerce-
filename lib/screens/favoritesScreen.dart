import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbkshopping/screens/productDetailsScreen.dart';

import '../controllers/favorites_controller.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(
        () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
          itemCount: favoriteController.favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteController.favoriteProducts[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Get.to(ProductDetailsScreen(product: product ,));
                  },
                  child: Container(
                    width: 150, // Adjust the width as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.network(
                            product.images.isNotEmpty
                                ? product.images[0]
                                : 'https://via.placeholder.com/150', // Placeholder image URL
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
            
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Price: \$${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}
