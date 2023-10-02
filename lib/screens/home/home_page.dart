import 'package:catalog_app/screens/cart/cart_page_body.dart';
import 'package:catalog_app/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // creating widget list for navigation
  List<Widget> pages = const [HomePageBody()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      drawer: Drawer(
        elevation: 3.0,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DrawerHeader(
                  child: Center(
                      child: Image(
                    image: AssetImage('assets/images/laptop.png'),
                  )),
                ),
                const SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/order.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ORDERS',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/cart.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'CART',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/profile.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'PROFILE',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/coupon.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'COUPONS',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/feedback.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'FEEDBACK',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/contact.png'),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'CONTACT',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
