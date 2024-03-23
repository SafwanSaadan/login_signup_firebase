// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

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

  Future singIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed("auth");
      }
    } catch (e) {
      print(e);
    }
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

        // defaultFormField(
        //     controller: TextEditingController(),
        //     type: TextInputType.emailAddress,
        //     validate: "Please enter a valid email address",
        //     label: "email",
        //     prefix: Icons.email,
        //   ),
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

          // defaultFormField(
          //     controller: TextEditingController(),
          //     type: TextInputType.emailAddress,
          //     validate: "Please enter a valid password address",
          //     label: "password",
          //     prefix: Icons.lock,
          //     suffix: Icons.remove_red_eye,
          //     isPassword: true,
          //   ),
        ),
        const SizedBox(height: defaultPadding),
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () async {
              await singIn();
              // print('Email: ${_emailController.text.trim()}');
              // print('Password: ${_passwordController.text.trim()}');
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
