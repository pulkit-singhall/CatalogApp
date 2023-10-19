import 'package:catalog_app/widgets/cart_tile.dart';
import 'package:catalog_app/widgets/delivery_address_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = [];
  String name = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    getCartItems();
    getUserDeliveryDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
              fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 3.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        child: Column(
          children: [
            // address
            DeliveryAddressCart(name: name, address: address),
            Expanded(
              child: ListView.builder(
                  itemCount: cartItems.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final cartItem = cartItems[index];
                    return CartTile(
                      id: cartItem['id'],
                      price: cartItem['price'],
                      imageUrl: cartItem['imageUrl'],
                      title: cartItem['title'],
                      brand: cartItem['brand'],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getCartItems() async {
    List<Map<String, dynamic>> data = [];

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference cartCollection = firestore.collection('Cart_Details');

      FirebaseAuth auth = FirebaseAuth.instance;
      final currentUser = auth.currentUser;
      final String? uid = currentUser?.uid;

      CollectionReference itemCollection =
          cartCollection.doc(uid).collection('Cart_Items');

      await itemCollection.get().then((value) {
        for (var docSnapshot in value.docs) {
          final cartDoc = docSnapshot.data() as Map<String, dynamic>;
          data.add(cartDoc);
        }

        setState(() {
          cartItems = data;
        });
      });
    } catch (e) {
      print('error in retrieving from cart $e');
    }
  }

  Future<void> getUserDeliveryDetails() async {
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      final currentUser = auth.currentUser;
      final String? uid = currentUser?.uid;
      // firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final userCollection = firestore.collection('User_Details');

      await userCollection.doc(uid).get().then((value) {
        final data = value.data();
        address = data?['address'];
        name = data?['name'];
        setState(() {

        });
      });
    }
    catch(e){
      print(e.toString());
    }
  }

}
