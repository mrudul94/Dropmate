import 'package:dropmate/core/theme/app_pallete.dart';
import 'package:dropmate/features/auth/presentation/pages/signup_page.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_filed.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_gradient_button.dart';
import 'package:dropmate/features/auth/presentation/widget/utility/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static loginroute() =>
      MaterialPageRoute(builder: (context) => const SignInPage());
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // Check if the widget is still mounted before using the context
      if (mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign in.',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                AuthField(hintText: 'Email', controller: emailController),
                SizedBox(height: 15),

                AuthField(
                  hintText: 'Password',
                  controller: passwordController,
                  password: true,
                ),
                SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: 'Sign in',
                  function: loginUserWithEmailAndPassword,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, SignupPage.route());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
