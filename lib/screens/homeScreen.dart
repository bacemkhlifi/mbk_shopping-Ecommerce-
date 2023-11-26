import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbkshopping/services/CategoryService.dart';
import 'package:mbkshopping/widgets/theme.dart';
import '../models/category_model.dart';
import '../models/product.dart';
import '../services/ProductService.dart';
import 'productDetailsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> products;
  late Future<List<String>> categories;
  late Future<List<Product>> featuredProducts;
  late Future<List<Product>> recommendedProducts;
  
  final List<CategoryStatic> categories_static = [
  CategoryStatic(
    title: "Men's\nFashion",
    image: 'assets/categories/modehomme.jpg',
  ),
  CategoryStatic(
    title: 'woman\nFashion',
    image: 'assets/categories/modefemme.jpg',
  ),
  CategoryStatic(
    title: 'Kids\nClothing',
    image: 'assets/categories/modebaby.jpg',
  ),
  // Add more categories as needed
];

  @override
  void initState() {
    super.initState();
    products = ProductService.fetchProducts();
    categories = CategorieService.fetchCategories();
    featuredProducts = ProductService.fetchFeaturedProducts();
    recommendedProducts = ProductService.fetchRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                onChanged: (query) {
                  // TODO: Implement search functionality
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for products...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
         
          Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories_static.map((category) {
                          return CategoryContainer(
                            title: category.title,
                            image: category.image,
                            onTap: () {
                              // Handle category tap action
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
        
         
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Featured Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<List<Product>>(
            future: recommendedProducts,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ProductListView(products: snapshot.data!);
            },
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Recommended Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<List<Product>>(
            future: featuredProducts,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ProductListView(products: snapshot.data!);
            },
          ),
          SizedBox(height: 16),
          /* FutureBuilder<List<Product>>(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ProductListView(products: snapshot.data!.take(5).toList());
              },
            ),*/
        ],
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  final List<Product> products;

  ProductListView({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  Get.to(ProductDetailsScreen(product: products[index] ,));
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
                          products[index].images.isNotEmpty
                              ? products[index].images[0]
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
                              products[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,

                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Price: \$${products[index].price.toStringAsFixed(2)}',
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
            ),
          );
        },
      ),
    );
  }
}
class CategoryContainer extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  CategoryContainer({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
       
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 10.0), // Add margin between categories
        //width: 150.0, // Adjust the width as needed
        child: Column(
          children: [
            Container(
              height: 150.0, // Adjust the height of the image container
              width: 100.0, // Adjust the width of the image container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5.0, // Add space between the image and text
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0, // Adjust the font size as needed
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}