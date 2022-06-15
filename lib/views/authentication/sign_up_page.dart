import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/button_txt.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/authentication/widgets/form_username.dart';
import 'package:workout_zone/views/authentication/widgets/txt_sambut.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';

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
  bool check = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _compassController = TextEditingController();
  @override
  void initState() {
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
    super.initState();
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
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password length must be at least 8 characters';
                          }

                          return null;
                        },
                        title: 'Password',
                        hint: 'Enter Your Password',
                        controller: _passwordController,
                      ),
                      FormPassword(
                        validator: (value) {
                          if (value == null ||
                              value.length < 8 ||
                              value != _passwordController.text) {
                            return 'Password Does Not Match ';
                          }

                          return null;
                        },
                        title: 'Confirm Password',
                        hint: 'Re-Enter Your Password',
                        controller: _compassController,
                      ),

                      ///check box
                      ///
                      ///

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: kPrimaryColor,
                              value: check,
                              onChanged: (val) {
                                setState(
                                  () {
                                    check = val!;
                                    _isCheck = val;
                                  },
                                );
                              },
                            ),
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
                      ButtonWithLatar(
                        title: 'Sign Up',
                        press: _isUserEpty &&
                                _isEmailEtpy &&
                                _isPhoneEmpty &&
                                _isPassEty &&
                                _isComEpty &&
                                _isCheck
                            ? () {
                                if (_formkey.currentState!.validate()) {
                                  context.router.push(
                                    VerfikasiSignUp(
                                        email: _emailController.text),
                                  );
                                }
                              }
                            : null,
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
                      context.router.push(
                        const SignInRoute(),
                      );
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
