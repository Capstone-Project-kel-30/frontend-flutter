import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
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
  late TextEditingController _passwordController;
  late TextEditingController _emailController;

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
                      controller: _passwordController, read: false,
                    ),
                    const VerticalSpace(height: 15),

                    ///button
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is Authenticating) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 5),
                                content: Text('Logging In ...'),
                              ),
                            );
                        }
                        if (state is Authenticated) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Text('Login Success'),
                              ),
                            );
                          context.router.replaceAll([const HomeWrapper()]);
                        }
                        if (state is SignInError) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text(state.msg),
                              ),
                            );
                        }
                      },
                      child: CustomElevatedButton(
                        text: "Login",
                        onPressed: _isEmailEpty && _isPassEmpty
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  final String email = _emailController.text;
                                  final String password =
                                      _passwordController.text;
                                  context.read<AuthBloc>().add(
                                        SignInRequest(
                                          email,
                                          password,
                                        ),
                                      );
                                }
                              }
                            : null,
                      ),
                    ),
                    const VerticalSpace(height: 15),

                    ///text yang dibawah button

                    ///forget button
                    ForgetPassBttn(
                      titile: 'Forget Password?',
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
                  txt1: "Don't have an account yet?",
                  txt2: 'Sign Up',
                  tekan: () {
                    context.router.replaceAll([
                      const SignInRoute(),
                      const SignUpRoute(),
                    ]);
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
