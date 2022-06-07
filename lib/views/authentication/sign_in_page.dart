import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/bottom_txt.dart';
import 'package:workout_zone/views/authentication/widgets/forget_pass_bttn.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import 'widgets/form_username.dart';
import 'widgets/text_sambut.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: AppTheme.theme(context).textTheme.titleMedium?.copyWith(
                fontWeight: kRegularWeight,
              ),
        ),
        centerTitle: true,
        toolbarHeight: 68,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: kDarkColor,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      ///body
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: TextSambut(
                    sambut1: 'Welcome Back\n',
                    smabut2: 'asdsadasdjhadjsahdjhadjads\nakasdhjahdjkasd',
                  ),
                ),
                const VerticalSpace(height: 30),

                ///Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const FormUsername(
                        hint: 'Masukan Email',
                        title: 'Email',
                      ),
                      const VerticalSpace(height: 10),
                      const FormPassword(
                        title: "Password",
                        hint: "Masukan Password",
                      ),
                      const VerticalSpace(height: 60),

                      ///button
                      ButtonWithLatar(
                        title: "Sign In",
                        press: () {
                          context.router.push(
                            const HomeWrapper(),
                          );
                        },
                      ),

                      ///text yang dibawah button
                      const VerticalSpace(height: 10),
                      const ForgetPassBttn(),
                      const VerticalSpace(height: 240),
                      Bottomtxt(
                        txt1: "Not Have Account yet ?",
                        txt2: 'Sign Up',
                        press: () {
                          context.router.push(
                            const SignUpRoute(),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
