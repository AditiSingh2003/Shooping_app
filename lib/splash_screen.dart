import 'package:shopping_app/AuthScreen/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () { Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login_Signup()),
      );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF08080),
      child: Center(
        child: Text(
          'Case It',
          style: TextStyle(
            fontFamily: 'DancingScript',
            decoration: TextDecoration.none,
            fontSize: 48,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}