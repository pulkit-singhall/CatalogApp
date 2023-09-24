import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  final String name;
  final String mobile;
  final String email;
  final String address;


  UserData(
      {required this.name,
      required this.mobile,
      required this.email,
      required this.address});
}

Map<String,String> userDataToJSON(UserData user){
  return {
    'name' : user.name.toString(),
    'mobile' : user.mobile.toString(),
    'email' : user.email.toString(),
    'address' : user.address.toString(),
  };
}

Future<Map<String,String>> retrieveUserData() async {
  // firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = auth.currentUser;
  final String? uid = currentUser?.uid;
  // firestore
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  CollectionReference userCollection = firestoreInstance.collection('Users');

  try{
    final res = await userCollection.doc(uid).collection('Details').get();
    return res as Future<Map<String,String>>;
  }
  catch(e){
    print('Error in retrieving data $e');
  }
  return {};
}