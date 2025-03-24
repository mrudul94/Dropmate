import 'package:dartz/dartz.dart';
import 'package:dropmate/core/error/failure.dart';
import 'package:dropmate/features/auth/domain/repository/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.signInWithGoogle();
  }
}
