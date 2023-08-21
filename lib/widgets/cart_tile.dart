import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  const CartTile(
      {super.key,
      required this.price,
      required this.imageUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 243, 227, 1.0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage(imageUrl),
              width: 10,
              height: 10,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('\$ $price',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ],
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
