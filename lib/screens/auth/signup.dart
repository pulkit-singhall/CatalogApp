import 'package:catalog_app/screens/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
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
                // register action
                if(validateSignUp(email.text.toString(), password.text.toString())){
                  signUp(email.text.toString(), password.text.toString());
                }
              },
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(2.0),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(140, 40)),
              ),
              child: const Text(
                'SIGN UP',
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
                'Already a user?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                width: 5,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Login();
                    }));
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    );
  }

  signUp(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  bool validateSignUp(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      print('Invalid credentials');
      return false;
    }
    return true;
  }
}
