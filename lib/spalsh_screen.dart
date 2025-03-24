import 'package:dropmate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dropmate/features/auth/presentation/pages/home_page.dart';
import 'package:dropmate/features/auth/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      await user.reload(); // Refresh user data to check verification
      user = auth.currentUser; // Get the latest user info

      if (user!.emailVerified) {
        // Email verified, navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Email NOT verified, navigate to LoginScreen
        Navigator.pushReplacement(context, SignInPage.loginroute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset('assets/welcomePaggeimage.png'),
        ),
      ),
    );
  }
}
