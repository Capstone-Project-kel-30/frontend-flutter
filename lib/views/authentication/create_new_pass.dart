import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({Key? key}) : super(key: key);

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _newPassword = TextEditingController();
  final _comnewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Password',
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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Your new password, must be different from previously used password.',
                  ),
                  FormPassword(
                    validator: (value) {
                      if (value == null ||
                          value.length < 8 ||
                          !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                              .hasMatch(value)) {
                        return 'Masukan Password yang valid ';
                      }
                      return null;
                    },
                    title: 'New Password',
                    hint: 'Enter new password',
                    controller: _newPassword,
                  ),
                  FormPassword(
                    validator: (value) {
                      if (value == null ||
                          value.length < 8 ||
                          !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                              .hasMatch(value)) {
                        return 'Masukan Password yang valid ';
                      }
                      if (value != _newPassword.text) {
                        return 'Password Not Match';
                      }
                      return null;
                    },
                    title: 'Comfirm New Password',
                    hint: 'Enter new confirm password',
                    controller: _comnewPassword,
                  )
                ],
              ),
            ),
            ButtonWithLatar(
                title: 'Confirm',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    context.router.push(
                      const SignInRoute(),
                    );
                  }
                })
          ],
        ),
      )),
    );
  }
}
