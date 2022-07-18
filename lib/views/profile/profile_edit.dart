import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import '../../bloc/user/user_bloc.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/form_password.dart';
import '../widgets/form_username.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/vertical_space.dart';
import 'widget/image_profile.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _nomorControllers = TextEditingController();

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
              child: BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is UserSuccess) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Update Success'),
                        ),
                      );
                  }
                  if (state is UserUpdateFailed) {
                    context.router.replaceAll([
                      ErrorRoute(
                        isHome: false,
                        message: "Unable to Update Profile",
                      ),
                    ]);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(state.msg),
                        ),
                      );
                  }
                },
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
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                final String user = _userController.text;
                                final String phone = _nomorControllers.text;
                                final String password =
                                    _passwordController.text;
                                final String email = _emailController.text;

                                if (user.isNotEmpty ||
                                    phone.isNotEmpty ||
                                    password.isNotEmpty ||
                                    email.isNotEmpty) {
                                  context.read<UserBloc>().add(
                                        UpdateUser(
                                          email: email != "" ? email : null,
                                          name: user != "" ? user : null,
                                          password:
                                              password != "" ? password : null,
                                          phone: phone != "" ? phone : null,
                                        ),
                                      );
                                }

                                _userController.clear();
                                _nomorControllers.clear();
                                _passwordController.clear();
                                _emailController.clear();
                              }),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    heightFactor: 18,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
