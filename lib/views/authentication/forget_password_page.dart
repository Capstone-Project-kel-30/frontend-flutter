import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Enter the email you’ve used to sign up to WorkoutZone.",
                ),
                const VerticalSpace(height: 20),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 10,
                        ),
                        fillColor: kDarkColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kGreyColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(height: 490),
                ButtonWithLatar(
                  title: "Recover Password",
                  press: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
