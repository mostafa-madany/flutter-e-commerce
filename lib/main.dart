import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lab/EditProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_lab/LoginScreen.dart';
import 'package:firebase_lab/ProductListScreen.dart';
import 'package:firebase_lab/ProfileScreen.dart';
import 'package:firebase_lab/SignupScreen.dart';
import 'package:firebase_lab/addProductPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthWrapper(), // Use AuthWrapper for initial routing
      routes: {
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/addProduct': (context) => const AddProductPage(),
        '/productList': (context) => ProductListScreen(),
        '/EditProductScreen': (context) => EditProductScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return  ProductListScreen(); // Or the screen you want to show for logged-in users
        }
        return  LoginScreen(); // Show the login screen if no user is logged in
      },
    );
  }
}
