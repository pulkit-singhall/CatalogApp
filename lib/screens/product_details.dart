import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  // parameters
  final String title;
  final double price;
  final String imageUrl;
  const ProductDetails(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late String title;
  late String imageUrl;
  late double price;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    imageUrl = widget.imageUrl;
    price = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 243, 227, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(
                    width: 110,
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 38),
              ),
              const Spacer(),
              Image(image: AssetImage(imageUrl)),
              const Spacer(),
              Text(
                '\$ $price',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              ElevatedButton(
                onPressed: () {
                  // add to cart action
                },
                style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(3.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                  maximumSize:
                      MaterialStateProperty.all<Size>(const Size(250, 100)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 26,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
