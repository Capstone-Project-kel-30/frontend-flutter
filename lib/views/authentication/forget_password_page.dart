import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../utils/routes/routes.gr.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/vertical_space.dart';
import 'widgets/form_username.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isEmailEpy = false;

  late TextEditingController _forgetPassword;
  @override
  void initState() {
    _forgetPassword = TextEditingController();
    _forgetPassword.addListener(() {
      setState(() {
        _isEmailEpy = _forgetPassword.text.isNotEmpty;
      });
    });
    super.initState();
  }

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
                        if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                            .hasMatch(value)) {
                          return 'Insert Correct Email';
                        }
                        return null;
                      },
                      controller: _forgetPassword,
                      hint: 'Enter Your Email',
                      title: 'Email',
                      keyboard: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),

              ///button

              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Authenticating) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text('Loading ...'),
                        ),
                      );
                  }
                  if (state is AuthSuccess) {
                    context.router.push(
                      VerfikasiForgetPassword(
                        email: _forgetPassword.text,
                        otp: state.otp,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('OTP has been sent to your email'),
                        ),
                      );
                  }
                  if (state is AuthenticationError) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(state.msg),
                        ),
                      );
                  }
                },
                child: CustomElevatedButton(
                  text: "Recover Password",
                  onPressed: _isEmailEpy
                      ? () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            final String email = _forgetPassword.text;
                            context.read<AuthBloc>().add(
                                  OTPRequest(email),
                                );
                          }
                        }
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
