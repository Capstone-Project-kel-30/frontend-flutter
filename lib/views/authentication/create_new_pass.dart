import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/cutom_elevated_button.dart';
import 'widgets/form_password.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({Key? key}) : super(key: key);

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  bool _passEpy = false;
  bool _comPass = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _comnewPassword = TextEditingController();

  @override
  void initState() {
    _newPassword = TextEditingController();
    _comnewPassword = TextEditingController();
    _newPassword.addListener(() {
      setState(() {
        _passEpy = _newPassword.text.isNotEmpty;
      });
    });

    _comnewPassword.addListener(() {
      setState(() {
        _comPass = _comnewPassword.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Password',
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
                    title: 'New Password',
                    hint: 'Enter new password',
                    controller: _newPassword,
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return 'Password length must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  FormPassword(
                    title: 'Comfirm New Password',
                    hint: 'Enter new confirm password',
                    controller: _comnewPassword,
                    validator: (value) {
                      if (value == null ||
                          value.length < 8 ||
                          (value != _newPassword.text)) {
                        return 'Password Does Not Match';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            CustomElevatedButton(
              text: 'Confirm',
              onPressed: _passEpy && _comPass
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        context.router.replace(
                          const SignInRoute(),
                        );
                      }
                    }
                  : null,
            )
          ],
        ),
      )),
    );
  }
}
