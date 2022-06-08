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
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

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
        title: Text(
          'Sign in',
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
                        sambut1: 'Welcome Back\n',
                        smabut2: 'asdsadasdjhadjsahdjhadjads\nakasdhjahdjkasd',
                      ),
                    ),
                    const VerticalSpace(height: 20),
                    FormUsername(
                      hint: 'Masukan Email',
                      title: 'Email',
                      controller: _emailController,
                      color: kDarkColor,
                    ),

                    FormPassword(
                      title: "Password",
                      hint: "Masukan Password",
                      controller: _passwordController,
                    ),
                    const VerticalSpace(height: 15),

                    ///button
                    ButtonWithLatar(
                      title: "Sign In",
                      press: () {
                        context.router.push(
                          VerfikasiSignUp(email: _emailController.text),
                        );
                      },
                    ),
                    const VerticalSpace(height: 10),

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

                    //text yang dibawah
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
