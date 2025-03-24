import 'package:dropmate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dropmate/features/auth/data/repository/auth_repository_impl.dart';
import 'package:dropmate/features/auth/domain/repository/auth_repository.dart';
import 'package:dropmate/features/auth/domain/usecases/signup_with_email.dart';
import 'package:dropmate/features/auth/domain/usecases/signup_with_google.dart';

final sl = GetIt.instance;

void setup() {
  if (!sl.isRegistered<FirebaseAuth>()) {
    sl.registerLazySingleton(() => FirebaseAuth.instance);
  }

  if (!sl.isRegistered<GoogleSignIn>()) {
    sl.registerLazySingleton(() => GoogleSignIn());
  }

  // Register AuthRepositoryImpl correctly
  if (!sl.isRegistered<AuthRepositoryImpl>()) {
    sl.registerLazySingleton<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(sl<FirebaseAuth>(), sl<GoogleSignIn>()),
    );
  }

  // Also register it as AuthRepository (interface)
  if (!sl.isRegistered<AuthRepository>()) {
    sl.registerLazySingleton<AuthRepository>(() => sl<AuthRepositoryImpl>());
  }

  if (!sl.isRegistered<SignUpWithEmail>()) {
    sl.registerLazySingleton(() => SignUpWithEmail(sl<AuthRepository>()));
  }

  if (!sl.isRegistered<SignInWithGoogle>()) {
    sl.registerLazySingleton(() => SignInWithGoogle(sl<AuthRepository>()));
  }

  if (!sl.isRegistered<AuthBloc>()) {
    sl.registerFactory(
      () => AuthBloc(
        signUpWithEmail: sl<SignUpWithEmail>(),
        signInWithGoogle: sl<SignInWithGoogle>(),
        authRepository: sl<AuthRepository>(), // Use interface
      ),
    );
  }
}
