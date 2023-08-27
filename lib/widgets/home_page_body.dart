import 'dart:convert';

import 'package:catalog_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global_variables.dart';
import '../screens/product_details.dart';
import 'category_chip.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late Future<List<dynamic>> categories;
  var startIndex = 0;

  // categories
  Future<List<dynamic>> getCategory() async {
    String url = "https://dummyjson.com/products/categories";
    var res = await http.get(Uri.parse(url));

    var body = res.body;
    var data = jsonDecode(body);
    print(data);

    return data;
  }

  @override
  void initState() {
    super.initState();
    categories = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(
          color: Colors.grey,
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 16.0),
      child: Column(
        children: [
          // starting heading and search bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Categories\nCollection",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 210,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: border,
                    disabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          // category list
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 50,
              child: FutureBuilder(
                  future: categories, builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: RefreshProgressIndicator());
                    }

                    final categoryData = snapshot.data!;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryData.length,
                        itemBuilder: (context, index) {
                          final String filter = categoryData[index].toString();
                          print(filter);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            child: GestureDetector(
                              onTap: () {
                                startIndex = index;
                                setState(() {});
                              },
                              child: CategoryChip(
                                filter: filter,
                                startIndex: startIndex,
                                index: index,
                              ),
                            ),
                          );
                        });
              }),
            ),
          ),
          // another list view builder
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductDetails(
                            title: product['title'].toString(),
                            price: product['price'] as double,
                            imageUrl: product['imageUrl'].toString(),
                          );
                        }));
                      },
                      child: ProductCard(
                        title: product['title'].toString(),
                        price: product['price'] as int,
                        image: product['imageUrl'].toString(),
                        index: index,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
