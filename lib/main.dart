import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Home/homeScreen.dart';
import 'package:shopping_app/WishList/Wishlist.dart';
import 'package:shopping_app/splash_screen.dart';
import 'package:shopping_app/AddToCart/AddTocart.dart';


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
      routes: {
        '/home': (context) => const HomeScreen(),
        '/wishlist': (context) => const WishlistPage(),
        '/addtocart': (context) => const addToCart(),
      },
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
