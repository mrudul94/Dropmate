import 'package:dropmate/features/auth/domain/repository/auth_repository.dart';
import 'package:dropmate/features/auth/domain/usecases/signup_with_email.dart';
import 'package:dropmate/features/auth/domain/usecases/signup_with_google.dart';
import 'package:dropmate/features/auth/presentation/bloc/auth_event.dart';
import 'package:dropmate/features/auth/presentation/widget/utility/show_snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
    required SignUpWithEmail signUpWithEmail,
    required SignInWithGoogle signInWithGoogle,
  }) : super(AuthInitial()) {
    // Handle Sign Up
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());

      final result = await authRepository.signUpWithEmailAndPassword(
        event.email,
        event.password,
      );

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (_) => emit(AuthSuccess()), // Emit success on successful signup
      );
    });

    // Handle Sending Email Verification

    // Handle Google Sign-In
    on<SignInWithGoogleRequested>((event, emit) async {
      emit(AuthLoading());

      final result = await authRepository.signInWithGoogle();
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (_) => emit(AuthSuccess()),
      );
    });

    // Handle Email Login
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      final result = await authRepository.loginUserWithEmailAndPassword(
        event.email,
        event.password,
      );

      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (_) => emit(AuthSuccess()),
      );
    });
  }
}
