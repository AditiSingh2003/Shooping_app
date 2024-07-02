import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/AuthScreen/mobile.dart';
import 'package:shopping_app/AuthScreen/signup.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Home/homeScreen.dart';
import '../Widget/header.dart';
import 'package:quickalert/quickalert.dart';

class Login_Signup extends StatefulWidget {
  const Login_Signup({super.key});

  @override
  State<Login_Signup> createState() => _Login_SignupState();
}

class _Login_SignupState extends State<Login_Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void failedMessage(){
    QuickAlert.show(
      context: context,
      headerBackgroundColor: Color(0xFFF08080),
      type: QuickAlertType.error,
      title: 'Login Failed',
      text: 'Password or Email is incorrect or Empty',
    );
  }

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
                      Text("Login to Account",
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
              Text("Welcome Back !",
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
      // body
      body:  SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.black,
                  ),
                  ),
                  Text('ang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color:Color(0xFFF08080),
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: _emailController,
                  validator: (_emailController) {
                  if (_emailController!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  return null; // Return null for valid input
                },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      // Navigator.pushNamedAndRemoveUntil(
                        // context, '/HomeScreen', (route) => false);
                    },
                    child: Text('Forgot Password ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                onPressed: () async {
                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                  );
                  if(userCredential.user?.uid != null)
                  {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                  print('Login successful: ${userCredential.user?.uid}');
                } on FirebaseAuthException catch (e) {
                  failedMessage();
                  print('Login failed: $e');
                }
              },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFF08080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account ?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFF08080),
                  ),
                  ),
                  ),
                ],
              ),
              
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MobileOtp()));
                  },
                  child: Text('Use Mobile Number',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  )
                  ),
                  Icon(Icons.phone,)
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}


