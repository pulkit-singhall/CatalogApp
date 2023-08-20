import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // parameters
  final String title;
  final double price;
  final String image;
  final int index;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: Checkbox.width,
      color: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(
          230, 181, 151, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(title),
            const SizedBox(
              height: 15,
            ),
            Text('\$ $price'),
            const SizedBox(
              height: 15,
            ),
            Image(image: AssetImage(image),
                height: 180,
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
