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

Future<void> addUser(UserData newUser) async {
  try{
    Map<String,String> data = userDataToJSON(newUser);

    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    CollectionReference userCollection = firestoreInstance.collection('User_Details');

    FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final String? uid = currentUser?.uid;
    await userCollection.doc(uid).set(data);
  }
  catch(e){
    print('error in adding user data' + e.toString());
  }
}

Future<Map<String,String>> retrieveUserData() async {
  // firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = auth.currentUser;
  final String? uid = currentUser?.uid;
  // firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userCollection = firestore.collection('Users');

  try{
    final collection = await userCollection.doc(uid).collection('Details');

  }
  catch(e){
    print('error in retrieving user data $e');
  }
  return {};
}