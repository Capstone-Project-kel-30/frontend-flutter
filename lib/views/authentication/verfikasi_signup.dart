import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../utils/routes/routes.gr.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/horizontal_space.dart';
import '../widgets/vertical_space.dart';
import 'widgets/button_txt.dart';
import 'widgets/form_kotak.dart';
import 'widgets/txt_email_validasi.dart';

class VerfikasiSignUp extends StatefulWidget {
  const VerfikasiSignUp({Key? key, required this.email, required this.otp})
      : super(key: key);
  final String email, otp;

  @override
  State<VerfikasiSignUp> createState() => _VerfikasiSignUpState();
}

class _VerfikasiSignUpState extends State<VerfikasiSignUp> {
  String currentOTP = '';
  final GlobalKey<FormState> _formKotak = GlobalKey();
  late TextEditingController _kotak1;
  late TextEditingController _kotak2;
  late TextEditingController _kotak3;
  late TextEditingController _kotak4;
  late TextEditingController _kotak5;
  late TextEditingController _kotak6;
  bool _kotk1 = false;
  bool _kotk2 = false;
  bool _kotk3 = false;
  bool _kotk4 = false;
  bool _kotk5 = false;
  bool _kotk6 = false;

  @override
  void initState() {
    super.initState();
    _kotak1 = TextEditingController();
    _kotak2 = TextEditingController();
    _kotak3 = TextEditingController();
    _kotak4 = TextEditingController();
    _kotak5 = TextEditingController();
    _kotak6 = TextEditingController();

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
    _kotak5.addListener(() {
      setState(() {
        _kotk5 = _kotak4.text.isNotEmpty;
      });
    });
    _kotak6.addListener(() {
      setState(() {
        _kotk6 = _kotak4.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _kotak1.dispose();
    _kotak2.dispose();
    _kotak3.dispose();
    _kotak4.dispose();
    _kotak5.dispose();
    _kotak6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verification',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Center(
            child: Column(
              children: [
                TxtEmailValidasi(user: widget.email),
                const VerticalSpace(height: 15),
                Form(
                  key: _formKotak,
                  child: Row(
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
                      FormKotak(
                        controller: _kotak5,
                      ),
                      const HorizontalSpace(width: 10),
                      FormKotak(
                        controller: _kotak6,
                      ),
                      // const HorizontalSpace(width: 10),
                    ],
                  ),
                ),
                const VerticalSpace(height: 20),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      setState(() {
                        currentOTP = state.otp;
                      });
                    }
                  },
                  child: Bottomtxt(
                    txt1: 'I don’t receive a code!',
                    txt2: 'Please resend',
                    tekan: () {
                      context.read<AuthBloc>().add(
                            OTPRequest(widget.email),
                          );
                    },
                  ),
                ),
                const VerticalSpace(height: 64),
                CustomElevatedButton(
                  text: "Verify",
                  onPressed: _kotk1 &&
                          _kotk2 &&
                          _kotk3 &&
                          _kotk4 &&
                          _kotk5 &&
                          _kotk6
                      ? () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final String userOtp =
                              '${_kotak1.text}${_kotak2.text}${_kotak3.text}${_kotak4.text}${_kotak5.text}${_kotak6.text}';
                          if (userOtp == widget.otp || userOtp == currentOTP) {
                            context.router.replaceAll([const SignInRoute()]);
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text('Sign Up Success'),
                                ),
                              );
                          } else {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text('OTP doesn\'t match'),
                                ),
                              );
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
