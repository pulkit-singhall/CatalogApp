import 'package:catalog_app/providers/providers.dart';
import 'package:catalog_app/screens/auth/signup.dart';
import 'package:catalog_app/screens/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userInstance = ref.watch(userInstanceProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping App",
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(244, 217, 4, 1.0),
        ),
        useMaterial3: false,
      ),
      home: userInstance == null ? const SignUp() : const HomeScreen(),
    );
  }
}
