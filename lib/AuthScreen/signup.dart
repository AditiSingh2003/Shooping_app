import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/AuthScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Firebase_Implement/firebase_auth_services.dart';
import '../Widget/header.dart';
import '../Firebase_Implement/firebase_auth_services.dart';

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
            color:  Color(0xFFFFDE32),
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
                      Text("Sign Up to Case-It",
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
            children: [
              Container(
                      width: MediaQuery.of(context).size.width,
                      child:ElevatedButton(
                  onPressed: () {
                    // Add your Google sign-up logic here
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    primary: Color(0xFFFFDE32),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       // Add some spacing between the icon and text
                      Text(
                        'Sign Up with Google',
                        style: TextStyle(fontSize: 16,
                        color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8.0),
                        Image.asset(
                          'assets/images/images.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Or',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
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
                controller: _passwordController,
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
                    value: false,
                    onChanged: (value) {
                      // put the code here
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
                        onPressed: () {},
                        child: Text("Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          primary: Color(0xFFFFDE32),
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
                      await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login_Signup()));
                    },
                    child: Text("Login",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFFDE32),
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