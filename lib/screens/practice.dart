import 'dart:convert';

import 'package:catalog_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  late Future<Map<String,dynamic>> data;

  Future<Map<String,dynamic>> getData() async {
    const String url = "https://dummyjson.com/products";
    var res = await http.get(Uri.parse(url));
    var body = res.body;
    var data = jsonDecode(body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    data=getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice", style: TextStyle(color: Colors.black),),
        elevation: 3.0,
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder(
        future: data,
          builder: ( context, snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: RefreshProgressIndicator(),);
            }

            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }

            final productData = snapshot.data!;

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemCount: 30,
                    itemBuilder: (context, index){
                    final title = productData["products"][index]["title"];
                    final price = productData["products"][index]["price"];
                    final image = productData["products"][index]["thumbnail"];
                    return ProductCard(title: title, price: price, image: image, index: index);
                }),
              ),
            );
          }
      ),
    );
  }
}
