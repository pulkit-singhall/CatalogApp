import 'dart:convert';

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
    final url = "https://dummyjson.com/products";
    var res = await http.get(Uri.parse(url));
    var body = res.body;
    print(body.runtimeType);
    var data = jsonDecode(body);
    print(data.runtimeType);
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
      body: FutureBuilder(
        future: data,
          builder: ( context, snapshot){
            return const Scaffold();
          }
      ),
    );
  }
}
