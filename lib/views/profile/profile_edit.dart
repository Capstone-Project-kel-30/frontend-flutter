import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/bloc/user/user_bloc.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/widgets/button_txt.dart';
import 'package:workout_zone/views/authentication/widgets/form_password.dart';
import 'package:workout_zone/views/authentication/widgets/form_username.dart';
import 'package:workout_zone/views/profile/widget/image_profile.dart';
import 'package:workout_zone/views/widgets/cutom_elevated_button.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool _usernameEmpy = false;
  bool _phoneEmpy = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _nomorControllers = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userController.addListener(() {
      setState(() {
        _usernameEmpy = _userController.text.isNotEmpty;
      });
    });
    _nomorControllers.addListener(() {
      setState(() {
        _phoneEmpy = _nomorControllers.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    _nomorControllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit Profile",
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return Column(
                      children: [
                        ProfileImage(
                          press: () {},
                          title: "Change",
                          color: kPrimaryColor,
                        ),
                        FormUsername(
                          title: "Email",
                          hint: state.user.data!.email!,
                          controller: _emailController,
                        ),
                        FormPassword(
                          title: "Password",
                          hint: "*************",
                          controller: _passwordController,
                        ),
                        const VerticalSpace(height: 10),
                        ForgetPassBttn(
                          titile: "Change Password",
                          press: () {
                            context.router.push(const NewPassword());
                          },
                        ),
                        FormUsername(
                          title: "Username",
                          hint: state.user.data!.name!,
                          controller: _userController,
                        ),
                        FormUsername(
                          keyboard: TextInputType.phone,
                          title: "No.HP",
                          hint: state.user.data!.phone!,
                          controller: _nomorControllers,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 63),
                          child: CustomElevatedButton(
                            text: "Save",
                            onPressed:
                                _usernameEmpy && _phoneEmpy ? () {} : null,
                          ),
                        ),
                      ],
                    );
                  }
                  return const ShimmerPlaceholder(height: 100, width: 100);
                },
              ),
            ),
          ),
        ));
  }
}
