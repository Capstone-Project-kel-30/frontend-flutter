import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

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
  final GlobalKey<FormState> _formKotak = GlobalKey();
  TextEditingController _kotak1 = TextEditingController();
  TextEditingController _kotak2 = TextEditingController();
  TextEditingController _kotak3 = TextEditingController();
  TextEditingController _kotak4 = TextEditingController();
  bool _kotk1 = false;
  bool _kotk2 = false;
  bool _kotk3 = false;
  bool _kotk4 = false;

  @override
  void initState() {
    _kotak1 = TextEditingController();
    _kotak2 = TextEditingController();
    _kotak3 = TextEditingController();
    _kotak4 = TextEditingController();

    _kotak1.addListener(() {
      setState(() {
        _kotk1 = _kotak1.text.isNotEmpty;
      });
    });
    _kotak2.addListener(() {
      setState(() {
        _kotk2 = _kotak2.text.isNotEmpty;
      });
    });
    _kotak3.addListener(() {
      setState(() {
        _kotk3 = _kotak3.text.isNotEmpty;
      });
    });
    _kotak4.addListener(() {
      setState(() {
        _kotk4 = _kotak4.text.isNotEmpty;
      });
    });
    super.initState();
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
          child: Center(
            child: Column(
              children: [
                TxtEmailValidasi(
                  user: widget.email,
                ),
                const VerticalSpace(height: 15),
                Form(
                  key: _formKotak,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormKotak(
                        controller: _kotak1,
                      ),
                      const HorizontalSpace(width: 10),
                      FormKotak(
                        controller: _kotak2,
                      ),
                      const HorizontalSpace(width: 10),
                      FormKotak(
                        controller: _kotak3,
                      ),
                      const HorizontalSpace(width: 10),
                      FormKotak(
                        controller: _kotak4,
                      ),
                      const HorizontalSpace(width: 10),
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
                  press: _kotk1 && _kotk2 && _kotk3 && _kotk4
                      ? () {
                          if (_formKotak.currentState!.validate()) {
                            context.router.replace(const CreateNewPass());
                          }
                        }
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
