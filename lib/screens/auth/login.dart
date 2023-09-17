import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final textBorder = OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.yellow.shade600,
    width: 2,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                border: textBorder,
                focusedBorder: textBorder,
                disabledBorder: textBorder,
              ),
              maxLines: 1,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 350,
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                border: textBorder,
                focusedBorder: textBorder,
                disabledBorder: textBorder,
              ),
              maxLines: 1,
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                // login action
                if (validateLogin(
                    email.text.toString(), password.text.toString())) {
                      login(email.text.toString(),password.text.toString());
                }
                else {
                  SnackBar message = const SnackBar(
                    content: Text(
                      'Pls fill the details!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                    backgroundColor: Color.fromRGBO(244, 217, 4, 1.0),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                }
              },
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(2.0),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(140, 40)),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New User?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 5,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'SIGNUP',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    );
  }

  login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  bool validateLogin(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }
}
