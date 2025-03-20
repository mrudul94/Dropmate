import 'dart:async';

import 'package:dropmate/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
   
    super.initState();
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('assets/welcomePaggeimage.png'))),
    );
  }
}