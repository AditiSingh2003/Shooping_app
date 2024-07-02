import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/AuthScreen/mobile.dart';
import 'package:shopping_app/Home/homeScreen.dart';
import '../Widget/header.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code ="";
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
            color:  const Color(0xFFF08080),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
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
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Enter OTP",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("We have sent you an OTP on your mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Pinput(
                  length: 6,
                  onChanged: (value) {
                    setState(() {
                      code = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: MobileOtp.verify, smsCode: code);
                      await auth.signInWithCredential(credential);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                          (route) => false,
                        );
                      }
                      catch(e){
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF08080),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: const Text("Verify OTP",
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 18,
                    ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Didn't receive OTP ?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: (){
                    codeSent: (String verificationId, int? resendToken) {
                    MobileOtp.verify = verificationId;
                    };
                  },
                  child: const Text("Resend OTP",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFF08080),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}