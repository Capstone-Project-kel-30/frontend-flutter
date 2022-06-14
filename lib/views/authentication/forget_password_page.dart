import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/form_username.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _forgetPassword = TextEditingController();

  @override
  void dispose() {
    _forgetPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forget Password',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Enter the email you've used to sign up to WorkoutZone.",
                  ),
                  const VerticalSpace(height: 15),

                  ///Form
                  Form(
                    key: _formKey,
                    child: FormUsername(
                      validator: (value) {
                        if (value == null || value.length < 14) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(
                                r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                            .hasMatch(value)) {
                          return 'Insert Correct Email';
                        }
                        return null;
                      },
                      color: kPrimaryColor,
                      controller: _forgetPassword,
                      hint: 'Enter Your Email',
                      title: 'Email',
                      keyboard: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),

              ///button

              ButtonWithLatar(
                title: "Recover Password",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    context.router.push(
                      VerfikasiForgetPassword(email: _forgetPassword.text),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
