import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropmate/core/theme/app_pallete.dart';
import 'package:dropmate/features/auth/presentation/pages/sign_in_page.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_filed.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_gradient_button.dart';
import 'package:dropmate/features/auth/presentation/widget/google_signin_button.dart';
import 'package:dropmate/features/auth/domain/repository/firebase_auth_methods.dart';
import 'package:dropmate/features/auth/domain/repository/firebase_store_user_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signUpWithEmail() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  Future<void> saveTheUserDetails() async {
    FirebaseStoreUserId(FirebaseFirestore.instance).upLoadUserDetail(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign up.',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  AuthField(hintText: 'Name', controller: nameController),
                  SizedBox(height: 15),
                  AuthField(hintText: 'Email', controller: emailController),
                  SizedBox(height: 15),
                  AuthField(
                    hintText: 'Phone Number',
                    controller: phoneController,
                  ),
                  SizedBox(height: 15),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    password: true,
                  ),
                  SizedBox(height: 20),
                  AuthGradientButton(
                    buttonText: 'Sign Up',
                    function: signUpWithEmail,
                    function2: saveTheUserDetails,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignInPage.loginroute());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              color: AppPallete.gradient2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(children: [GoogleSigninButton()]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
