import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
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

Map<String, dynamic> userDataToJSON(UserData user) {
  return {
    'name': user.name.toString(),
    'mobile': user.mobile.toString(),
    'email': user.email.toString(),
    'address': user.address.toString(),
  };
}

Future<void> addUser(UserData newUser) async {
  try {
    Map<String, dynamic> data = userDataToJSON(newUser);

    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    CollectionReference userCollection =
        firestoreInstance.collection('User_Details');

    FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final String? uid = currentUser?.uid;
    await userCollection.doc(uid).set(data);
  } catch (e) {
    print('error in adding user data$e');
  }
}

Future<Map<String, dynamic>> retrieveUserData() async {
  // firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = auth.currentUser;
  final String? uid = currentUser?.uid;
  // firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userCollection = firestore.collection('User_Details');

  final docRef = userCollection.doc(uid);
  final profileData = await docRef.get().then((DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return data;
  });

  return profileData;
}

Future<void> updateUserAddress(UserData user) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = auth.currentUser;
  final String? uid = currentUser?.uid;
  // firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userCollection = firestore.collection('User_Details');

  final newData = userDataToJSON(user);

  await userCollection.doc(uid).update(newData);
}


