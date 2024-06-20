import 'package:bloc_app/core/secrets/server_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpwithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpwithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final _response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        "name": name, // Extra includes which method does not provide
      });
      if (_response.user == null) {
        throw const ServerException("User is null");
      }
      return _response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
