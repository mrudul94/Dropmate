import 'package:dartz/dartz.dart';
import 'package:dropmate/core/error/failure.dart';
import 'package:dropmate/features/auth/domain/repository/auth_repository.dart';

class SignUpWithEmail {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  Future<Either<Failure, void>> call(String email, String password) {
    return repository.signUpWithEmailAndPassword(email, password);
  }
}
