import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:workout_zone/bloc/auth/auth_bloc.dart';
import 'package:workout_zone/bloc/user/user_bloc.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/profile/widget/card_option.dart';
import 'package:workout_zone/views/profile/widget/card_profile.dart';
import 'package:workout_zone/views/widgets/custom_outlined_button.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileSeting extends StatefulWidget {
  const ProfileSeting(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);
  final String name, email, phone;

  @override
  State<ProfileSeting> createState() => _ProfileSetingState();
}

class _ProfileSetingState extends State<ProfileSeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BlocListener<UserBloc, UserState>(
                    listener: (context, state) {},
                  ),
                  CardProfile(
                    nama: widget.name,
                    email: widget.email,
                    nomor: widget.phone,
                  ),
                  const VerticalSpace(height: 10),
                  Row(
                    children: [
                      Text(
                        "Help",
                        style: AppTheme.theme(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              fontWeight: kSemiBoldWeight,
                            ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 10),
                  const CardOption(
                    asset: 'assets/icons/bx_help-circle.svg',
                    title: 'FaQ',
                  ),
                  const CardOption(
                    title: 'Contact Us',
                    asset: 'assets/icons/cell.svg',
                  )
                ],
              ),
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is SignOutLoading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text("Signing Out"),
                        ),
                      );
                  }
                  if (state is UnAuthenticated) {
                    Restart.restartApp();
                  }
                },
              ),
              CustomOutlinedButton(
                text: 'log Out',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text(""),
                          ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
