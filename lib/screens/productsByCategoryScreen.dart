import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import '../services/ProductService.dart';

import 'productDetailsScreen.dart';
class ProductsCategory extends StatefulWidget {
  const ProductsCategory({Key? key}) : super(key: key);

  @override
  State<ProductsCategory> createState() => _ProductsCategoryState();
}

class _ProductsCategoryState extends State<ProductsCategory> {
  late Future<List<Product>> products;
  late String categoryName;
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    categoryName = Get.arguments as String? ?? "";
    refreshData();
  }

  Future<void> refreshData() async {
    setState(() {
     
      products = ProductService.fetchProductsByCategoryBeta(categoryName.replaceAll(' ', '-')); 
      filterProducts('');
    });
  }

  void filterProducts(String query)  async {
    if (query.isEmpty) {
      // If the query is empty, display all products
      filteredProducts = await products;
    } else {
      // Filter products based on the query
      filteredProducts = await products.then((value){
        return value.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList() ;


      });
          
    }
    setState(() {}); // Trigger a rebuild of the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: SingleChildScrollView(
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
                      filterProducts(query);
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
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: FutureBuilder<List<Product>>(
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

                    // Display filtered products instead of all products
                    return ProductListView(products: filteredProducts);
                  },
                ),
              ),
            ],
          ),
        ),
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
      height: MediaQuery.of(context).size.height*0.75, // Adjust the height as needed
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of cards in a row
          crossAxisSpacing: 8.0, // Spacing between cards horizontally
          mainAxisSpacing: 8.0, // Spacing between cards vertically
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                Get.to(ProductDetailsScreen(product: products[index]));
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
          );
        },
      ),
    );
  }
}
