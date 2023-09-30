import 'package:flutter/material.dart';

import '../Widget/header.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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

      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Enter OTP",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("We have sent you an OTP on your mobile number",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Verify OTP"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFDE32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Didn't receive OTP ?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: (){},
                child: Text("Resend OTP",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFDE32)
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}