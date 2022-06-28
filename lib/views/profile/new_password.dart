import 'package:flutter/material.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/widgets/cutom_elevated_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _oldPasswordCntrl = TextEditingController();
  final TextEditingController _newPasswordCntrl = TextEditingController();
  final TextEditingController _comNewPassCtrl = TextEditingController();

  @override
  void dispose() {
    _oldPasswordCntrl.dispose();
    _newPasswordCntrl.dispose();
    _comNewPassCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Password",
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                FormPassword(
                  title: "Old Password",
                  hint: "Enter Password",
                  controller: _oldPasswordCntrl,
                ),
                FormPassword(
                  title: "New Password",
                  hint: "Enter New Password",
                  controller: _newPasswordCntrl,
                ),
                FormPassword(
                  title: "Confirm New Password",
                  hint: "Enter Password",
                  controller: _comNewPassCtrl,
                )
              ],
            ),
            CustomElevatedButton(
              text: "Save",
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
