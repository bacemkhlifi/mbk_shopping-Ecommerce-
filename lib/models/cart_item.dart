import 'package:flutter/material.dart';

class CartItem {
  String id; // Unique identifier for the cart item
  int count; // Number of items in the cart
  final String productId; // Unique identifier for the product
  final String name; // Name of the product
  double price; // Price of the product (use double for numeric values)
  final String image; // URL or path to the product image
  String dateOfPurchase; // Date when the item was added to the cart
  String shopId; // Unique identifier for the shop

  // Compute the total cost of items in the cart
  double get total => price * count;

  // Constructor for creating a CartItem
  CartItem({
    required this.id, // Allow id to be null when creating a new item
    required this.count,
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.dateOfPurchase,
    required this.shopId, // Allow shopId to be null when creating a new item
  });

  // Factory constructor to create a CartItem from JSON data
  factory CartItem.fromJson(Map<String, dynamic> jsonData) {
    return CartItem(
      id: jsonData["_id"],
      count: jsonData["count"],
      productId: jsonData["productId"],
      name: jsonData["name"],
      price: jsonData["price"].toDouble(), // Parse price as double
      image: jsonData["image"],
      dateOfPurchase: jsonData["date"],
      shopId: jsonData["shopId"],
    );
  }

  // Convert CartItem to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "count": count,
      "productId": productId,
      "name": name,
      "price": price,
      "image": image,
      "date": dateOfPurchase,
      "shopId": shopId,
    };
  }
}
