import 'package:catalog_app/model/cart.dart';
import 'package:catalog_app/widgets/cart_tile.dart';
import 'package:flutter/material.dart';

class CartPageBody extends StatefulWidget {
  const CartPageBody({super.key});

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> {
  late Future<List<Map<String, dynamic>>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
