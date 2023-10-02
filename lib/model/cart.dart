import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartData {
  final String id;
  final String title;
  final String imageUrl;
  final int price;

  CartData(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price});
}

Map<String, dynamic> cartDataToJson(CartData cartItem) {
  return {
    'id': cartItem.id,
    'price': cartItem.price,
    'imageUrl': cartItem.imageUrl,
    'title': cartItem.title
  };
}

Future<void> addToCart(CartData cartItem) async {
  Map<String, dynamic> itemToAdd = cartDataToJson(cartItem);

  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference cartCollection = firestore.collection('Cart_Details');

    FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final String? uid = currentUser?.uid;

    cartCollection
        .doc(uid)
        .collection('Cart_Items')
        .doc(cartItem.id)
        .set(itemToAdd);
  } catch (e) {
    print('error in adding into cart $e');
  }
}

Future<void> deleteFromCart(CartData cartItem) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference cartCollection = firestore.collection('Cart_Details');

    FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final String? uid = currentUser?.uid;

    cartCollection.doc(uid).collection('Cart_Items').doc(cartItem.id).delete();
  } catch (e) {
    print('error in deleting from cart $e');
  }
}

Future<List<Map<String, dynamic>>> getCartItems() async {
  List<Map<String, dynamic>> data = [];

  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference cartCollection = firestore.collection('Cart_Details');

    FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final String? uid = currentUser?.uid;

    CollectionReference itemCollection =
        cartCollection.doc(uid).collection('Cart_Items');

    itemCollection.get().then((value) {
      for (var docSnapshot in value.docs) {
        final cartDoc = docSnapshot.data() as Map<String, dynamic>;
        data.add(cartDoc);
      }
      return data;
    });
  } catch (e) {
    print('error in retrieving from cart $e');
  }

  return data;
}
