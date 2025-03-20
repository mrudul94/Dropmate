// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dropmate/features/auth/presentation/widget/utility/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // Email SignUp
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Google signup
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the user cancels sign-in
      if (googleUser == null) {
        showSnackBar(context, "Google Sign-in canceled.");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            // Handle new user logic (e.g., storing user data in Firestore)
            if (kDebugMode) {
              print("New user signed in: ${userCredential.user!.uid}");
            }
          } else {
            if (kDebugMode) {
              print("Existing user signed in: ${userCredential.user!.uid}");
            }
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message ?? "Something went wrong.");
      log(e.message!);
    } catch (e) {
      log(e.toString());
      showSnackBar(context, "An error occurred: $e");
    }
  }
}
