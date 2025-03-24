import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropmate/core/theme/app_pallete.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_event.dart';
import 'package:dropmate/features/auth/presentation/pages/sign_in_page.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_filed.dart';
import 'package:dropmate/features/auth/presentation/widget/auth_gradient_button.dart';
import 'package:dropmate/features/auth/presentation/widget/google_signin_button.dart';
import 'package:dropmate/features/auth/presentation/widget/utility/show_snack_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, state.message);
                } else if (state is AuthSuccess) {
                  Navigator.pushReplacement(context, SignInPage.loginroute());
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
                        'Sign up.',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
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
                        buttonText: "Sign Up",
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              SignUpRequested(
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
