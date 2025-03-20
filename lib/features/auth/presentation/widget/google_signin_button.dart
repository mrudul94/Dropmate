import 'package:dropmate/features/auth/domain/repository/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('google'),
      onPressed: () {
        FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context);
      },
    );
  }
}
