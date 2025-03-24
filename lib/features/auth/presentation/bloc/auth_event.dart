import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const SignUpRequested(this.email, this.password, this.context);

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogleRequested extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginRequested(this.email, this.password, this.context);

  @override
  List<Object> get props => [email, password];
}
