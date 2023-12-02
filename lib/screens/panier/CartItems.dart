import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/config.dart';
import '../../controllers/cart_controller.dart';
import '../../models/product.dart';

class PanierCard extends StatelessWidget {
  const PanierCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();
    
 SizeConfig().init(context);
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = controller.products.keys.toList()[index];
            final quantity = controller.products.values.toList()[index];
            return Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
              child: CartProductCard(
                controller: controller,
                product: product,
                quantity: quantity,
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add a border
        borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // Optional: Add shadow
          ),
        ],
       
      ),
      height: SizeConfig.blockSizeVertical * 14.7,
      //color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.blockSizeVertical *30 ,
            width: SizeConfig.blockSizeHorizontal * 17,
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 4,
            ),
            child: Image.network(product.thumbnail), // Adjust with the actual image path
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 5,
              right: SizeConfig.blockSizeHorizontal * 5,
              top: SizeConfig.blockSizeVertical,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  product.title,
                ),
                Text(
                  "€ ${product.price}", // Adjust with the actual price property
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                      ),
                      onPressed: () {
                        controller.addProduct(product);
                      },
                    ),
                    Text("$quantity"),
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                      ),
                      onPressed: () {
                        controller.removeProduct(product);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
              size: SizeConfig.blockSizeVertical * 4,
            ),
            onPressed: () {
              controller.DeleteProduct(product);
            },
          ),
        ],
      ),
    );
  }
}
