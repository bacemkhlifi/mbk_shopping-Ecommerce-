import 'package:flutter/material.dart';

class EmptyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: EmptyCart());
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
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
