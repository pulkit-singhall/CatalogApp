import 'package:catalog_app/widgets/images_list.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // values needed
    final String title = actualProduct['title'].toString();
    final String description = actualProduct['description'].toString();
    final String brand = actualProduct['brand'].toString();
    final int price = actualProduct['price'];
    final List<dynamic> images = actualProduct['images'];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 243, 227, 1.0),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              title,
            ),
            // images
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ImageList(
                      imageUrl: images[index],
                    );
                  }),
            ),
            SingleChildScrollView(child: Text(description)),
            Row(
              children: [
                Text('\$ $price'),
                Text(brand),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Add To Cart')),
          ],
        ),
      ),
    );
  }
}
