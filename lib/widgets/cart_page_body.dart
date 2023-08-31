
import 'package:catalog_app/providers/cart_add.dart';
import 'package:catalog_app/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CartPageBody extends StatefulWidget {
  const CartPageBody({super.key});

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> {

  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> cart = Provider.of<CartItems>(context).cart;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: ListView.builder(
          itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return CartTile(
                price: cartItem['price'] as int,
                imageUrl: cartItem['imageUrl'].toString(),
                title: cartItem['title'].toString(),
              );
            }
        ),
      ),

    );
  }
}
