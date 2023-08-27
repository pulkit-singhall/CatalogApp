import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // parameters
  final String title;
  final double price;
  final String image;
  final int index;
  final double rating;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.index,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index.isEven
            ? const Color.fromRGBO(216, 240, 253, 1)
            : const Color.fromRGBO(243, 243, 248, 1.0),
      ),
      width: Checkbox.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22,
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text('$rating',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(Icons.star, color: Colors.black, size: 22,),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(image),
                  width: 260,
                  height: 180,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
