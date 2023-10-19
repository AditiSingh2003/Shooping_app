import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/Home/homeScreen.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   Future<User?> signInWithGoogle() async {
//     try {
//       // Trigger the Google Sign In process
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();

//       // Return null if the user cancels the sign-in process
//       if (googleSignInAccount == null) {
//         return null;
//       }

//       // Obtain the GoogleSignInAuthentication object
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       // Create a new credential using the GoogleSignInAuthentication object
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       // Sign in to Firebase with the Google Auth credentials
//       final UserCredential authResult =
//           await _auth.signInWithCredential(credential);

//       return authResult.user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     await googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }

// class AuthService {
//   Future<void> signInWithGoogle() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     final UserCredential userCredential = 
//       await auth.signInWithCredential(credential);
//   }
// }

// function to implement the google signin

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
	final GoogleSignIn googleSignIn = GoogleSignIn();
	final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
	if (googleSignInAccount != null) {
	final GoogleSignInAuthentication googleSignInAuthentication =
		await googleSignInAccount.authentication;
	final AuthCredential authCredential = GoogleAuthProvider.credential(
		idToken: googleSignInAuthentication.idToken,
		accessToken: googleSignInAuthentication.accessToken);
	
	// Getting users credential
	UserCredential result = await auth.signInWithCredential(authCredential);
	User? user = result.user;
	
	if (result != null) {
		Navigator.pushReplacement(
			context, MaterialPageRoute(builder: (context) => HomeScreen()));
	} // if result not null we simply call the MaterialpageRoute,
		// for go to the HomePage screen
	}
}
