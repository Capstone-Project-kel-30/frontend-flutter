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
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _userController = TextEditingController();
    TextEditingController _nomorControllers = TextEditingController();
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
                        press: () {
                          context.router.push(ProfileSeting());
                        },
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
                        title: "No.HP",
                        hint: state.user.data!.phone!,
                        controller: _nomorControllers,
                      ),
                      BlocListener<UserBloc, UserState>(
                        listener: (context, state) {
                          if (state is UpdateUser) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text("Saving..."),
                                ),
                              );
                            if (state is UserUpdateFailed) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    content: Text(state.msg),
                                  ),
                                );
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 63),
                          child: CustomElevatedButton(
                            text: "Save",
                            onPressed: () {
                              context.read()<UserBloc>().add(
                                    UpdateUser(
                                      _emailController.text,
                                      _nomorControllers.text,
                                      _nameController.text,
                                      _passwordController.text,
                                    ),
                                  );
                            },
                          ),
                        ),
                      )
                    ],
                  );
                }

                return Column(
                  children: [
                    ProfileImage(
                      press: () {
                        context.router.push(ProfileSeting());
                      },
                      title: "Change",
                      color: kPrimaryColor,
                    ),
                    FormUsername(
                      title: "Email",
                      hint: "dadangkonelo@gmail.com",
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
                      hint: "dadadaang",
                      controller: _userController,
                    ),
                    FormUsername(
                      title: "No.HP",
                      hint: "080128381301283",
                      controller: _nomorControllers,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 63),
                      child: CustomElevatedButton(
                        text: "Save",
                        onPressed: () {},
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
