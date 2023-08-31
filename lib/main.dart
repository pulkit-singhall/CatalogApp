import 'package:catalog_app/global_variables.dart';
import 'package:catalog_app/providers/cart_add.dart';
import 'package:catalog_app/screens/home_page.dart';
import 'package:catalog_app/screens/product_details.dart';
import 'package:catalog_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartItems>(
      create: ((context) => CartItems()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        themeMode: ThemeMode.light,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(244, 217, 4, 1.0),
          ),
          useMaterial3: false,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
