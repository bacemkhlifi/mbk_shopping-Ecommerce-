import 'package:flutter/material.dart';
import 'package:mbkshopping/widgets/theme.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Smartphones", "image": "https://i.dummyjson.com/data/products/1/thumbnail.jpg"},
    {"name": "Laptops", "image": "https://i.dummyjson.com/data/products/6/thumbnail.png"},
    {"name": "Fragrances", "image": "https://i.dummyjson.com/data/products/11/thumbnail.jpg"},
    {"name": "Skincare", "image": "https://i.dummyjson.com/data/products/16/thumbnail.jpg"},
    {"name": "Groceries", "image": "https://i.dummyjson.com/data/products/21/thumbnail.png"},
    {"name": "Home Decoration", "image": "https://i.dummyjson.com/data/products/26/thumbnail.jpg"},
    {"name": "Furniture", "image": "https://i.dummyjson.com/data/products/31/thumbnail.jpg"},
    {"name": "Tops", "image": "https://i.dummyjson.com/data/products/36/thumbnail.jpg"},
    {"name": "Womens Dresses", "image": "https://i.dummyjson.com/data/products/41/thumbnail.webp"},
    {"name": "Womens Shoes", "image": "https://i.dummyjson.com/data/products/46/thumbnail.jpg"},
    {"name": "Mens Shirts", "image": "https://i.dummyjson.com/data/products/51/thumbnail.jpg"},
    {"name": "Mens Shoes", "image": "https://i.dummyjson.com/data/products/56/thumbnail.jpg"},
    {"name": "Mens Watches", "image": "https://i.dummyjson.com/data/products/61/thumbnail.jpg"},
    {"name": "Womens Watches", "image": "https://i.dummyjson.com/data/products/66/thumbnail.jpg"},
    {"name": "Womens Bags", "image": "https://i.dummyjson.com/data/products/71/thumbnail.jpg"},
    {"name": "Womens Jewellery", "image": "https://i.dummyjson.com/data/products/76/thumbnail.jpg"},
    {"name": "Sunglasses", "image": "https://i.dummyjson.com/data/products/81/thumbnail.jpg"},
    {"name": "Automotive", "image": "https://i.dummyjson.com/data/products/86/thumbnail.jpg"},
    {"name": "Motorcycle", "image": "https://i.dummyjson.com/data/products/91/thumbnail.jpg"},
    {"name": "Lighting", "image": "https://i.dummyjson.com/data/products/96/thumbnail.jpg"},
    
    // Add more categories as needed
  ];

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text("Categories",style: headingStyle,textAlign: TextAlign.start,)),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      // TODO: Handle tap on category (navigate to category details, etc.)
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              category["image"]!,
                              width: double.infinity,
                              height: 120.0, // Adjust the height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category["name"]!,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                       /* Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Implement "See More" functionality
                              },
                              child: Text("See More",textAlign: TextAlign.end,),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                );
              },
           
          ),
        ),
      ],
    );
  }
}