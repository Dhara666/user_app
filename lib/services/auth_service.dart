import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meditation_twoplus/common/widget/common_snackbar.dart';

class AuthServices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //     ======================= Google Sign In =======================     //
  Future<UserCredential> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await googleSignInAccount.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return null;
    } catch (e) {
      print('Catch error in signInWithGoogle --> $e');
      return null;
    }
  }

//     ======================= Facebook Sign In =======================     //
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

//     ======================= Email Sign Up =======================     //

  Future<UserCredential> signUpWithEmail(
      {String emailInput, String passwordInput, BuildContext context}) async {
    try {
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailInput, password: passwordInput);
      return result;
    } catch (e) {
      commonSnackBar(context: context, text: e.message);
      return null;
    }
  }

  Future<UserCredential> signInWithEmail(
      {String emailInput, String passwordInput, BuildContext context}) async {
    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
          email: emailInput, password: passwordInput);
      return result;
    } catch (e) {
      commonSnackBar(context: context, text: e.message);
      return null;
    }
  }
}
