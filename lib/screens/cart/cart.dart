import 'package:catalog_app/model/cart.dart';
import 'package:catalog_app/widgets/cart_tile.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<Cart> {
  late Future<List<Map<String, dynamic>>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ),
      body: FutureBuilder(
        future: cartItems,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: RefreshProgressIndicator(),
            );
          }

          final cartItemList = snapshot.data!;
          return ListView.builder(
              itemCount: cartItemList.length,
              itemBuilder: (BuildContext context, int index) {
                final cartItem = cartItemList[index];
                return CartTile(
                  price: cartItem['price'],
                  imageUrl: cartItem['imageUrl'],
                  title: cartItem['title'],
                );
              });
        },
      ),
    );
  }
}
