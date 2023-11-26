import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final bool isEmpty;

  CartScreen({required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: isEmpty ? EmptyCart() : CartItemsList(), // Display EmptyCart or CartItemsList based on isEmpty flag
    );
  }
}

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cartEmpty.png', // Replace with the path to your empty cart image
            width: 300.0,
            height: 300.0,
          ),
          SizedBox(height: 18.0),
          Text(
            'Votre panier est vide.',
            style: TextStyle(fontSize: 18.0, ),
          ),
        ],
      ),
    );
  }
}

class CartItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the CartItemsList widget to display cart items
    return ListView(
      children: [
        // Add widgets to display cart items here
      ],
    );
  }
}
