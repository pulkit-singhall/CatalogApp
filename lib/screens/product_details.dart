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
        backgroundColor: const Color.fromRGBO(242, 243, 227, 1.0),
        toolbarHeight: 60,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
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
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Lato'),
                )),
            const Spacer(),
            const Spacer(),
            Row(
              children: [
                Text('\$ $price', style: const TextStyle(fontFamily: 'Lato', fontSize: 20,),),
                const Spacer(),
                Text(brand, style: const TextStyle(fontFamily: 'Lato', fontSize: 20,)),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  // add to cart mechanism
                },
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(3),
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.black),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
