import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int price;

  const CartTile(
      {super.key,
      required this.price,
      required this.imageUrl,
      required this.title,});

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
            content: const Text(
                'Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO')),
              TextButton(
                  onPressed: () {

                  },
                  child: const Text('YES')),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(220, 237, 246, 1.0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Row(
            children: [
              Image.network(
                widget.imageUrl,
                height: 80,
                width: 80,
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$ ${widget.price}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // dialog and delete
                  deleteDialog();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 32,
                  shadows: [
                    Shadow(color: Colors.white, offset: Offset.infinite), // try
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
