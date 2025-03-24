import 'package:dropmate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('google'),
      onPressed: () {
        context.read<AuthBloc>().add(SignInWithGoogleRequested());
      },
    );
  }
}
