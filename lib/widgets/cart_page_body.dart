import 'package:catalog_app/widgets/cart_tile.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return CartTile(
                price: cartItem['price'] as double,
                imageUrl: cartItem['imageUrl'].toString(),
                title: cartItem['title'].toString(),
              );
            }
        ),
      ),

    );
  }
}
