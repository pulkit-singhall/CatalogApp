import 'package:catalog_app/model/user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController address = TextEditingController();

  // data of user
  late Future<Map<String,dynamic>> user;

  @override
  void initState() {
    super.initState();
    user = retrieveUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: user!,
        builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot){

          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: RefreshProgressIndicator(),
            );
          }

          if(snapshot.hasData){
            final dataUser = snapshot.data;
            // print(dataUser);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Icon(
                    Icons.person,
                    size: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    dataUser!['name']!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    dataUser['mobile']!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    dataUser['email']!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    dataUser['address']!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      maxLines: 1,
                      controller: address,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Update Address',
                        border: OutlineInputBorder(),
                        disabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // update of address

                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(3.0),
                        minimumSize:
                        MaterialStateProperty.all<Size>(const Size(120, 40))),
                    child: const Text(
                      'UPDATE',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          }

          return const Center();
        },
      ),
    );
  }
}


