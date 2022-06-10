import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/button_txt.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/authentication/widgets/form_username.dart';
import 'package:workout_zone/views/authentication/widgets/txt_sambut.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  bool check = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _compassController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    emailController.dispose();
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
        title: Text(
          'Sign Up',
          style: AppTheme.theme(context).textTheme.titleMedium?.copyWith(
                fontWeight: kBoldWeight,
              ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: kDarkColor,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: TextSambut(
                    sambut1: 'Welcome !\n',
                    smabut2:
                        'Enjoy the gym with us, Create account to continue',
                  ),
                ),
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
                        color: kGreyColor,
                        keyboard: TextInputType.name,
                      ),
                      FormUsername(
                        validator: (value) {
                          if (value == null ||
                              value.length < 14 ||
                              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Please Enter a valid Email Address';
                          }
                          return null;
                        },
                        title: 'Email',
                        hint: 'Enter Email',
                        controller: emailController,
                        color: kGreyColor,
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
                        color: kGreyColor,
                        keyboard: TextInputType.phone,
                      ),
                      FormPassword(
                        validator: (value) {
                          if (value == null ||
                              value.length < 8 ||
                              !RegExp(r"([a-z0-9])([A-Z])").hasMatch(value)) {
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
                              value != _passwordController.text ||
                              !RegExp(r"([a-z0-9])([A-Z])").hasMatch(value)) {
                            return 'Password do not match';
                          }

                          return null;
                        },
                        title: 'Confirm Password',
                        hint: 'Re-Enter Your Password',
                        controller: _compassController,
                      ),
                      const VerticalSpace(height: 16),
                      CheckboxListTileFormField(
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        title: Text(
                            'By registering, you agree to Terms and Conditions',
                            style:
                                AppTheme.theme(context).textTheme.labelLarge),
                        validator: (value) {
                          if (value!) {
                            return null;
                          } else {
                            return 'You must accept the terms and conditions to register an account';
                          }
                        },
                      ),
                      const VerticalSpace(height: 16),
                      ButtonWithLatar(
                        title: 'Sign Up',
                        press: () {
                          if (_formkey.currentState!.validate()) {
                            context.router.push(
                              VerfikasiSignUp(email: emailController.text),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
