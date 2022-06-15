import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/vertical_space.dart';
import 'widgets/button_txt.dart';
import 'widgets/form_password.dart';
import 'widgets/form_username.dart';
import 'widgets/txt_sambut.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Sign in',
        ),
      ),

      ///body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                      keyboard: TextInputType.emailAddress,
                    ),

                    FormPassword(
                      validator: null,
                      title: "Password",
                      hint: "Enter your password",
                      controller: _passwordController,
                    ),
                    const VerticalSpace(height: 15),

                    ///button
                    CustomElevatedButton(
                      text: "Sign In",
                      onPressed: _isEmailEpty && _isPassEmpty
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.router.push(const HomeWrapper());
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

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Bottomtxt(
                  txt1: "Not Have Account yet ?",
                  txt2: 'Sign Up',
                  tekan: () {
                    context.router.push(
                      const SignUpRoute(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
