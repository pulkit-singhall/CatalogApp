

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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: ListView.builder(
          itemCount: 0, // ref to zero
            itemBuilder: (context, index) {
              return null;
            }
        ),
      ),

    );
  }
}
