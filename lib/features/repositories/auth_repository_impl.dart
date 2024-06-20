import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/secrets/server_exception.dart';
import 'package:bloc_app/features/data/datasource/auth_remote_source.dart';
import 'package:bloc_app/features/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> LoginwithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement LoginwithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpwithEmailandPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpwithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
