import 'package:catalog_app/widgets/cart_page_body.dart';
import 'package:catalog_app/widgets/home_page_body.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // creating widget list for navigation
  List<Widget> pages = const [HomePageBody(), CartPageBody()];
  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentPage==0 ? AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ) : AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value){
          currentPage = value;
          setState(() {

          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 35, color: Colors.black, ),
            label: 'Cart',
          ),
        ],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        showUnselectedLabels: false,
      ),
    );
  }
}
