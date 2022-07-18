import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/horizontal_space.dart';
import 'widgets/button_txt.dart';
import '../widgets/form_password.dart';
import '../widgets/form_username.dart';
import 'widgets/txt_sambut.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isUserEpty = false;
  bool _isEmailEtpy = false;
  bool _isPhoneEmpty = false;
  bool _isPassEty = false;
  bool _isComEpty = false;
  bool _isCheck = false;
  final GlobalKey<FormState> _formkey = GlobalKey();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _numberController;
  late TextEditingController _passwordController;
  late TextEditingController _compassController;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _numberController = TextEditingController();
    _passwordController = TextEditingController();
    _compassController = TextEditingController();
    _usernameController.addListener(() {
      setState(() {
        _isUserEpty = _usernameController.text.isNotEmpty;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _isEmailEtpy = _emailController.text.isNotEmpty;
      });
    });
    _numberController.addListener(() {
      setState(() {
        _isPhoneEmpty = _numberController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _isPassEty = _passwordController.text.isNotEmpty;
      });
    });
    _compassController.addListener(() {
      setState(() {
        _isComEpty = _compassController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    _compassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: TextSambut(
                    sambut1: 'Welcome !',
                    smabut2:
                        'Enjoy the gym with us, Create account to continue',
                  ),
                ),

                ///Form
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      FormUsername(
                        validator: (value) {
                          if (value == null ||
                              value.length < 4 ||
                              !RegExp(r"^[a-z0-9A-Z]").hasMatch(value)) {
                            return 'Please use only letters (a-z), and numbers.';
                          }
                          return null;
                        },
                        title: 'Username',
                        hint: 'Enter Username',
                        controller: _usernameController,
                        keyboard: TextInputType.name,
                      ),
                      FormUsername(
                        validator: (value) {
                          if (value == null ||
                              value.length < 14 ||
                              !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                                  .hasMatch(value)) {
                            return 'Please Enter a valid Email Address';
                          }
                          return null;
                        },
                        title: 'Email',
                        hint: 'Enter Email',
                        controller: _emailController,
                        keyboard: TextInputType.emailAddress,
                      ),
                      FormUsername(
                        validator: (value) {
                          if (value == null ||
                              value.length < 12 ||
                              RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        title: 'Phone Number',
                        hint: 'Enter Phone Number',
                        controller: _numberController,
                        keyboard: TextInputType.phone,
                      ),
                      FormPassword(
                        title: 'Password',
                        hint: 'Enter Your Password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password length must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      FormPassword(
                        title: 'Confirm Password',
                        hint: 'Re-Enter Your Password',
                        controller: _compassController,
                        validator: (value) {
                          if (value == null ||
                              value != _passwordController.text) {
                            return 'Password Does Not Match ';
                          }
                          return null;
                        }, 
                      ),

                      ///check box
                      ///
                      ///

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: SizedBox(
                                height: 18,
                                width: 18,
                                child: Checkbox(
                                  activeColor: kPrimaryColor,
                                  value: _isCheck,
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _isCheck = val!;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            const HorizontalSpace(width: 5),
                            Text(
                              'By registering, you agree to Terms and Conditions',
                              style:
                                  AppTheme.theme(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),

                      ///tombol dan validator
                      ///
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is Authenticating) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 5),
                                  content: Text('Loading ...'),
                                ),
                              );
                          }
                          if (state is AuthSuccess) {
                            context.router.push(
                              VerfikasiSignUp(
                                email: _emailController.text,
                                otp: state.otp,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('OTP has been sent to your email'),
                                ),
                              );
                          }
                          if (state is SignUpError) {
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
                          text: 'Register',
                          onPressed: _isUserEpty &&
                                  _isEmailEtpy &&
                                  _isPhoneEmpty &&
                                  _isPassEty &&
                                  _isComEpty &&
                                  _isCheck
                              ? () {
                                  if (_formkey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    final String username =
                                        _usernameController.text;
                                    final String email = _emailController.text;
                                    final String password =
                                        _passwordController.text;
                                    final String phone = _numberController.text;
                                    context.read<AuthBloc>().add(
                                          SignUpRequest(
                                            username,
                                            email,
                                            password,
                                            phone,
                                          ),
                                        );
                                  }
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),

                ///bottom txt
                ///
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Bottomtxt(
                    txt1: 'Already Have Accoount',
                    txt2: 'Sign In',
                    tekan: () {
                      context.router.replaceAll([
                        const SignUpRoute(),
                        const SignInRoute(),
                      ]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
