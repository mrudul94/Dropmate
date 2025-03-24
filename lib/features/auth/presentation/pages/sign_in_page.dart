import 'package:dropmate/core/theme/app_pallete.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_event.dart';
import 'package:dropmate/features/auth/presentation/pages/home_page.dart';
import 'package:dropmate/features/auth/presentation/pages/signup_page.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_filed.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_gradient_button.dart';
import 'package:dropmate/features/auth/presentation/widget/utility/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showSnackBar(context, state.message);
              } else if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in.',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
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
                      onpress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            LoginRequested(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              context,
                            ),
                          );
                        }
                      },
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
              );
            },
          ),
        ),
      ),
    );
  }
}
