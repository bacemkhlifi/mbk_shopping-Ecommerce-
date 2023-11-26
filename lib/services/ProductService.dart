import 'dart:convert';

import '../models/product.dart';
import 'package:http/http.dart' as http;
class ProductService {

  //fetch prodcut by category 
  static const baseUrl = 'https://dummyjson.com/products/category';

  static Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/$category'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products for category $category');
    }
  }

   static Future<Product> fetchProduct(int id) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the product data
      final Map<String, dynamic> productData = json.decode(response.body);
      return Product.fromJson(productData);
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load product');
    }
  }

   static Future<List<Product>> fetchFeaturedProducts() async {
    final List<int> productIds = [1, 79, 89, 45]; // Add more IDs as needed

    // Fetch featured products based on the IDs
    final List<Future<Product>> futures = productIds.map<Future<Product>>((id) => fetchProduct(id)).toList();

    // Wait for all futures to complete and get the list of products
    final List<Product> featuredProducts = await Future.wait(futures);

    return featuredProducts;
  }

  static Future<List<Product>> fetchRecommendedProducts() async {
    final List<int> productIds = [74, 33, 66, 99]; // Add more IDs as needed

    // Fetch featured products based on the IDs
    final List<Future<Product>> futures = productIds.map<Future<Product>>((id) => fetchProduct(id)).toList();

    // Wait for all futures to complete and get the list of products
    final List<Product> featuredProducts = await Future.wait(futures);

    return featuredProducts;
  }
  
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> productsData = data['products'];
      return productsData.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}