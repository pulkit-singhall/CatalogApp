import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';
import '../screens/auth/login.dart';
import '../screens/home/home_page.dart';

final userAuthProvider = StateNotifierProvider<UserAuthProvider, bool>((ref) {
  return UserAuthProvider();
});

class UserAuthProvider extends StateNotifier<bool>{
  UserAuthProvider() : super(true);

  // bool = true (user logged in)
  // false (user signed out)

  void signOutUser() async {
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      print('Logout Success');
      state = false;
    }
    catch(e){
      state = true;
      print('Error in Logout ${e.toString()}');
    }
  }

  void login(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('login success');
      SnackBar message = const SnackBar(
        content: Text(
          'Welcome Again!',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromRGBO(244, 217, 4, 1.0),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
      state = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        state = false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        state = false;
      }
    }
  }

  void signUp(String email, String password, BuildContext context, String name,
      String mobile, String address) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('User Registered Successfully');
      SnackBar message = const SnackBar(
        content: Text(
          'User Registered Successfully!',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromRGBO(244, 217, 4, 1.0),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Login();
      }));

      // push user module into database
      final UserData newUser =
      UserData(name: name, mobile: mobile, email: email, address: address);

      addUser(newUser);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      state= false;
    } catch (e) {
      print(e);
      state = false;
    }
  }
}