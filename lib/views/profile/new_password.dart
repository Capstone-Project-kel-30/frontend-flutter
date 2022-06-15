import 'package:flutter/material.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/widgets/cutom_elevated_button.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _oldePasswordCntrl = TextEditingController();
    TextEditingController _newPasswordCntrl = TextEditingController();
    TextEditingController _comNewPassCtrl = TextEditingController();
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
                  controller: _oldePasswordCntrl,
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
