import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/AuthScreen/otp.dart';
import '../Widget/header.dart';

class MobileOtp extends StatefulWidget {
  const MobileOtp({super.key});

  static String verify = "";

  @override
  State<MobileOtp> createState() => _MobileOtpState();
}

class _MobileOtpState extends State<MobileOtp> {
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  @override
  void initState() {
    super.initState();
    countryCode.text = "+91";
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
      // body
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Row(
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
                  color: Color(0xFFF08080),
                ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
                const Text('Enter Your Mobile Number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
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
              onPressed: () async {
                try{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: countryCode.text + phone,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                  MobileOtp.verify = verificationId;
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OTP()));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
                }
                catch(e){
                  print(e);
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: const Color(0xFFF08080), // Text color
                minimumSize: const Size(double.infinity, 50), // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Button border radius
                ),
              ),
              child: const Text(
                'Send OTP',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Container(
                child: const Column(children: [
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