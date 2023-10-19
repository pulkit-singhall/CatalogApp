import 'package:flutter/material.dart';

class RemoveCart extends StatelessWidget {
  const RemoveCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.remove_shopping_cart_sharp,
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'REMOVE',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
