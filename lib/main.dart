import 'package:bloc_app/core/secrets/app_secert.dart';
import 'package:bloc_app/core/theme/theme.dart';
import 'package:bloc_app/features/data/datasource/auth_remote_source.dart';
import 'package:bloc_app/features/domain/usecases/user_sign_up.dart';
import 'package:bloc_app/features/presentation/bloc/auth_bloc.dart';
import 'package:bloc_app/features/presentation/pages/login.dart';
import 'package:bloc_app/features/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabse = await Supabase.initialize(
    url: AppSecrets.supabaseURL,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                supabse.client,
              ),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
