import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Home PAGE')),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
