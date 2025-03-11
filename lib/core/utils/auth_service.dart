import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      debugPrint ("Error signing in with Google: $e");
      return null;
    }
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