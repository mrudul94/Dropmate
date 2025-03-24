import 'package:dropmate/core/injection_container.dart';
import 'package:dropmate/core/theme/theme.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dropmate/features/auth/presentation/pages/home_page.dart';
import 'package:dropmate/features/auth/presentation/pages/sign_in_page.dart';
import 'package:dropmate/firebase_options.dart';
import 'package:dropmate/spalsh_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup(); // Setting up dependency injection

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DropMate',
        theme: Apptheme.darkTheme,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data != null) {
              return const HomePage();
            }
            return SignInPage();
          },
        ),
      ),
    );
  }
}
