import 'package:catalog_app/providers/cart_add.dart';
import 'package:catalog_app/widgets/images_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  // parameters
  final Map<String, dynamic> product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Map<String, dynamic> actualProduct;

  @override
  void initState() {
    super.initState();
    actualProduct = widget.product;
  }

  // add to cart
  void addToCart() {
    Provider.of<CartItems>(context, listen: false).addProduct({
      'id': actualProduct['id'],
      'title': actualProduct['title'],
      'price': actualProduct['price'],
      "rating": actualProduct['rating'],
      'imageUrl': actualProduct['thumbnail'],
      'company': actualProduct['brand'],
    });
  }

  @override
  Widget build(BuildContext context) {
    // values needed
    final String title = actualProduct['title'].toString();
    final String description = actualProduct['description'].toString();
    final String brand = actualProduct['brand'].toString();
    final int price = actualProduct['price'];
    final List<dynamic> images = actualProduct['images'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Lato'),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 27,
              )),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
        child: Column(
          children: [
            // images
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: SizedBox(
                height: 300,
                width: 358,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return ImageList(
                        imageUrl: images[index],
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: 'Lato'),
                ),
              ),
            ),
            const Spacer(),
            // new color design
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 241, 234, 1.0),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '\$ $price',
                          style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown),
                        ),
                        const Spacer(),
                        Text(brand,
                            style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown)),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // add to cart mechanism
                          addToCart();
                          // snack bar
                          const message = SnackBar(
                            content: Text(
                              'Added To Cart',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            elevation: 3.0,
                            backgroundColor: Colors.brown,
                            duration: Duration(milliseconds: 1500),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(message);
                        },
                        style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(3),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size(150, 45)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ))),
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Lato'),
                        )),
                    const SizedBox(
                      height: 35,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
