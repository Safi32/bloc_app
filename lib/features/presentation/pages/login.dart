import 'package:bloc_app/core/theme/app_pallete.dart';
import 'package:bloc_app/features/presentation/pages/sign_up.dart';
import 'package:bloc_app/features/presentation/widgets/auth_field.dart';
import 'package:bloc_app/features/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign In.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    hintText: "Email",
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    hintText: "Password",
                    controller: _passwordController,
                    isObsecureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthGradientButton(
                    buttonText: "Sign In",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: "  Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
