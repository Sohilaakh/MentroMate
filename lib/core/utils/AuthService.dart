import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null; // User canceled the sign-in

    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    User? user = userCredential.user;

    if (user != null) {
      // Check if user exists in Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        // Save user data to Firestore if not exists
        await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
          'First Name': user.displayName?.split(' ')[0] ?? '',
          'Last Name': user.displayName?.split(' ')[1] ?? '',
          'Email': user.email,
          'Faculty': '',
          'Gender': '', // Optional, can be updated later
          'Major' : '',
        });
      }
    }
    return user;
  }


  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }



  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in process
      final LoginResult loginResult = await FacebookAuth.instance.login(
          permissions: ['email', 'public_profile']
      );


      if (loginResult.status == LoginStatus.success) {
        // Get the access token
        final AccessToken accessToken = loginResult.accessToken!;

        // Create a new credential
        final OAuthCredential credential =
        FacebookAuthProvider.credential(accessToken.tokenString);

        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          // Check if user exists in Firestore
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .get();

          if (!userDoc.exists) {
            // Save user data to Firestore if not exists
            await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
              'First Name': user.displayName?.split(' ')[0] ?? '',
              'Last Name': user.displayName?.split(' ')[1] ?? '',
              'Email': user.email,
              'Faculty': '',
              'Gender': '', // Optional, can be updated later
              'Major' : '',
            });
          }
        }

        // Sign in to Firebase with the credential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        print("Facebook Login Failed: ${loginResult.message}");
        return null;
      }
    } catch (e) {
      print("Error signing in with Facebook: $e");
      return null;
    }
  }


}