import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/button_txt.dart';
import 'package:workout_zone/views/authentication/widgets/form_kotak.dart';
import 'package:workout_zone/views/authentication/widgets/txt_email_validasi.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class VerfikasiForgetPassword extends StatefulWidget {
  const VerfikasiForgetPassword({Key? key, required this.email})
      : super(key: key);
  final String email;

  @override
  State<VerfikasiForgetPassword> createState() =>
      _VerfikasiForgetPasswordState();
}

class _VerfikasiForgetPasswordState extends State<VerfikasiForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
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
          child: Center(
            child: Column(
              children: [
                TxtEmailValidasi(
                  user: widget.email,
                ),
                Form(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FormKotak(),
                      HorizontalSpace(width: 10),
                      FormKotak(),
                      HorizontalSpace(width: 10),
                      FormKotak(),
                      HorizontalSpace(width: 10),
                      FormKotak(),
                      HorizontalSpace(width: 10),
                    ],
                  ),
                ),
                const VerticalSpace(height: 20),
                Bottomtxt(
                    txt1: 'I don’t receive a code!',
                    txt2: 'Please resend',
                    tekan: () {}),
                const VerticalSpace(height: 64),
                ButtonWithLatar(
                  title: "Confirm",
                  press: () {
                    context.router.push(
                      const CreateNewPass(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
