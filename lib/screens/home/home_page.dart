import 'package:catalog_app/widgets/cart_page_body.dart';
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
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
    );
  }
}
