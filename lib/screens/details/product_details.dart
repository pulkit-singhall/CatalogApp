import 'package:catalog_app/model/cartModel.dart';
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
  int isClicked = 0;

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
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(isClicked == 0){
                            isClicked = 1;
                            // add to cart mechanism
                            CartData cartItem = productToCartData(actualProduct);
                            addToCart(cartItem);
                          }
                          else{
                            isClicked = 0;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: 55,
                        width: isClicked == 1 ? 170 : 65,
                        decoration: BoxDecoration(
                          color: isClicked == 1 ? Colors.green : Colors.blue,
                          borderRadius: isClicked == 1
                              ? BorderRadius.circular(30)
                              : BorderRadius.circular(10),
                        ),
                        child: isClicked == 1
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Added to Cart',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            : Center(
                                child: Image.asset(
                                  'assets/images/cart.png',
                                  color: Colors.white,
                                  height: 27,
                                  width: 27,
                                ),
                              ),
                      ),
                    ),
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

CartData productToCartData(Map<String, dynamic> product) {
  CartData result = CartData(
      id: product['id'].toString(),
      title: product['title'],
      imageUrl: product['thumbnail'],
      price: product['price'],
      brand: product['brand']);
  return result;
}
