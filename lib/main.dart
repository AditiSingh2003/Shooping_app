import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Home/homeScreen.dart';
import 'package:shopping_app/NavBar/AddTocart.dart';
import 'package:shopping_app/NavBar/Wishlist.dart';
import 'package:shopping_app/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
        '/wishlist': (context) => WishlistPage(),
        '/addtocart': (context) => addToCart(),
      },
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
