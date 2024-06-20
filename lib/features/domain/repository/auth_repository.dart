import 'package:bloc_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpwithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> LoginwithEmailPassword({
    required String email,
    required String password,
  });
}
