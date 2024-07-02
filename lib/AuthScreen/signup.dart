import 'dart:math';
import 'package:quickalert/quickalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/AuthScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Firebase_Implement/firebase_auth_services.dart';
import 'package:shopping_app/Home/homeScreen.dart';

import '../Widget/header.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final AuthService authService = AuthService();
  bool isChecked = false;
  bool _obscureText = true;
  bool value = false;

  void failedMessage(){
    QuickAlert.show(
      context: context,
      headerBackgroundColor: Color(0xFFF08080),
      type: QuickAlertType.error,
      title: 'Login Failed',
      text: 'Password or Email is incorrect or Empty',
    );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 180,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color:  Color(0xFFF08080),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Text("Sign Up to Melang",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.account_circle_outlined,
                      size: 30,
                      ),
                    ],
                  ),
              Text("Welcome !",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter Your Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Confirm Your Password",
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text("I agree to the Terms of Service and Privacy Policy",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          try{
                            await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                              (route) => false,
                            );
                          }
                          catch(e){
                            print('heelo');
                            failedMessage();
                            print(e);
                          }
                        },
                        child: Text("Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50), backgroundColor: Color(0xFFF08080),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                  Text("Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login_Signup()));
                    },
                    child: Text("Login",
                    style: TextStyle(
                      fontSize: 20,
                      color:Color(0xFFF08080),
                    )
                    ),
                  ),
                  ],
                  ),
                  ],
              ),
                    ],
                  ),  
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AuthService {
  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = 
      await auth.signInWithCredential(credential);
  }
}