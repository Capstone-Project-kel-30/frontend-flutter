import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/button_txt.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/authentication/widgets/txt_sambut.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import 'widgets/form_username.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isEmailEpty = false;
  bool _isPassEmpty = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(
      () {
        setState(() {
          _isEmailEpty = _emailController.text.isNotEmpty;
        });
      },
    );
    _passwordController.addListener(
      () {
        setState(() {
          _isPassEmpty = _passwordController.text.isNotEmpty;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      appBar: AppBar(
        title: const Text(
          'Sign in',
        ),
      ),

      ///body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: TextSambut(
                        sambut1: 'Welcome Back',
                        smabut2: 'You have been missed, Login to continue',
                      ),
                    ),

                    FormUsername(
                      validator: (value) {
                        if (value == null ||
                            value.length < 14 ||
                            !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                                .hasMatch(value)) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      hint: 'Enter Email',
                      title: 'Email',
                      controller: _emailController,
                      color: kGreyColor,
                      keyboard: TextInputType.emailAddress,
                    ),

                    FormPassword(
                      validator: (value) {
                        if (value == null ||
                            value.length < 8 ||
                            !RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                                .hasMatch(value)) {
                          return 'Incorrect password';
                        }
                        return null;
                      },
                      title: "Password",
                      hint: "Enter your password",
                      controller: _passwordController,
                    ),
                    const VerticalSpace(height: 15),

                    ///button
                    ButtonWithLatar(
                      title: "Sign In",
                      press: _isEmailEpty && _isPassEmpty
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.router.push(
                                  VerfikasiSignUp(email: _emailController.text),
                                );
                              }
                            }
                          : null,
                    ),
                    const VerticalSpace(height: 15),

                    ///text yang dibawah button

                    ///forget button
                    ForgetPassBttn(
                      titile: 'Forget Password ?',
                      press: () {
                        context.router.push(
                          const ForgetPasswordRoute(),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Bottomtxt(
                txt1: "Not Have Account yet ?",
                txt2: 'Sign Up',
                tekan: () {
                  context.router.push(
                    const SignUpRoute(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
