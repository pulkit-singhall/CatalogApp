import 'package:catalog_app/screens/cart/cart.dart';
import 'package:catalog_app/screens/profile/profile.dart';
import 'package:catalog_app/widgets/drawer_text.dart';
import 'package:catalog_app/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

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
                GestureDetector(
                  child: const DrawerText(
                    heading: 'ORDERS',
                    image: 'assets/images/order.png',
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const DrawerText(
                    heading: 'CART',
                    image: 'assets/images/cart.png',
                  ),
                  onTap: () {
                    // cart Navigation
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Cart();
                    }));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const DrawerText(
                    heading: 'PROFILE',
                    image: 'assets/images/profile.png',
                  ),
                  onTap: () {
                    // profile navigation
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Profile();
                    }));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const DrawerText(
                    heading: 'COUPONS',
                    image: 'assets/images/coupon.png',
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  child: const DrawerText(
                    heading: 'FEEDBACK',
                    image: 'assets/images/feedback.png',
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const DrawerText(
                    heading: 'CONTACT',
                    image: 'assets/images/contact.png',
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
