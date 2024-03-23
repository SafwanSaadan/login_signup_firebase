import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../auth/auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  Future singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: kPrimaryColor,
          decoration: const InputDecoration(
            hintText: "Your email",
            prefixIcon: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Icon(Icons.person),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: TextFormField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              singIn;
              const Auth();
              // ignore: avoid_print
              print('Email: ${_emailController.text.trim()}');
              // ignore: avoid_print
              print('Password: ${_passwordController.text.trim()}');
            },
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        AlreadyHaveAnAccountCheck(
          press: () {
            singIn;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
