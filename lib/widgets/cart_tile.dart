import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int price;
  final String brand;

  const CartTile(
      {super.key,
      required this.price,
      required this.imageUrl,
      required this.title,
      required this.brand});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  // deletion of product from cart
  Future<dynamic> deleteDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Item'),
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO')),
              TextButton(onPressed: () {}, child: const Text('YES')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: Container(
        height: 230,
        width: Checkbox.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              right: BorderSide(
                width: 0.3,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
              left: BorderSide(
                width: 0.3,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
              top: BorderSide(
                width: 0.3,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
              bottom: BorderSide(
                width: 0.3,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.imageUrl,
                    height: 150,
                    width: 100,
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$ ${widget.price}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                            maxLines: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.brand,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
