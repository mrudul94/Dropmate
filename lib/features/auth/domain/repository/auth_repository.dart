import 'package:dartz/dartz.dart';
import 'package:dropmate/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> loginUserWithEmailAndPassword(
    String email,
    String password,
  );
}
