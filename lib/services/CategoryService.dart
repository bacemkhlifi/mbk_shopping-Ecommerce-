import 'dart:convert';
import 'package:http/http.dart' as http;


class CategorieService {

  
  static const baseUrl = 'https://dummyjson.com';

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((category) => category.toString()).toList();
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}
  class CategoryWithImage {
  final String category;
  final String image;
  static const baseUrl = 'https://dummyjson.com';
  CategoryWithImage({required this.category, required this.image});

  factory CategoryWithImage.fromJson(Map<String, dynamic> json) {
  final List<dynamic> products = json['products'] ?? [];
  String category = 'default_category_name';
  
  String image = 'default_image_url'; // Provide a default image URL if the category has no products

  if (products.isNotEmpty) {
    final Map<String, dynamic> firstProduct = products[0] ?? {};
    final dynamic thumbnail = firstProduct['thumbnail'];
     final dynamic categoryP = firstProduct['category'];

    if (thumbnail != null && thumbnail is String) {
      image = thumbnail;
      category = categoryP;
    }
  }

  return CategoryWithImage(
    category: category,
    image: image,
  );
}



  static Future<CategoryWithImage> fetchCategoryWithImage(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/products/category/$category?limit=1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('API Response for $category: $data'); // Print the full API response for debugging
      final categoryWithImage = CategoryWithImage.fromJson(data);
      print('Category: ${categoryWithImage.category}');
      print('Image URL: ${categoryWithImage.image}');
      return categoryWithImage;
    } else {
      throw Exception('Failed to fetch category with image for $category');
    }
  }
}




