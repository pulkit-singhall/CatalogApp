import 'package:flutter/material.dart';

class CartItems extends ChangeNotifier{

  // parameter
  final List<Map<String,dynamic>> cart = [];

  //functions
  void addProduct(Map<String,dynamic> product){
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String,dynamic> product){
    cart.remove(product);
    notifyListeners();
  }
}