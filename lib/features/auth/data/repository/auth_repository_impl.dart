import 'package:dartz/dartz.dart';
import 'package:dropmate/core/error/failure.dart';
import 'package:dropmate/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl(this.firebaseAuth, this.googleSignIn);

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? "Sign-up failed"));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return Left(Failure("Google sign-in canceled."));

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? "Google sign-in failed"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? "Login failed"));
    }
  }
}
