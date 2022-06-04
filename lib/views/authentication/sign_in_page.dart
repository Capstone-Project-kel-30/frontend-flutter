import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Sign In Under Development'),
            // ngga perlu styling di sini
            TextFormField(),
            // kalo mau custom bisa pake copyWith
            TextFormField(
              decoration: const InputDecoration().copyWith(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            TextButton(
              child: const Text('Go to Sign Up Page'),
              onPressed: () {
                context.router.push(const SignUpRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
