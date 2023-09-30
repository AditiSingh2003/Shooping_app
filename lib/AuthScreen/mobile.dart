import 'package:flutter/material.dart';
import '../Home/homeScreen.dart';
import '../Widget/header.dart';

class MobileOtp extends StatefulWidget {
  const MobileOtp({super.key});

  @override
  State<MobileOtp> createState() => _MobileOtpState();
}

class _MobileOtpState extends State<MobileOtp> {
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
      // body
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Case ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color: Colors.black,
                ),
                ),
                Text(' It',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color: Color(0xFFFFDE32),
                ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
                Text('Enter Your Mobile Number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: "+91 ",
                hintText: "Enter Your Name",
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary:Color(0xFFFFDE32),
                onPrimary: Colors.black, // Text color
                minimumSize: Size(double.infinity, 50), // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Button border radius
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Container(
                child: Column(children: [
                  Text(
                    'By continuing, you agree to our',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Terms of Service  ',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      ),
                      Text(
                        ' Privacy Policy',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  )
                ],
                ),
            ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}