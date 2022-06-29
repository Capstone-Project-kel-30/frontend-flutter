import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';
import 'package:workout_zone/bloc/auth/auth_bloc.dart';
import 'package:workout_zone/bloc/user/user_bloc.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/profile/widget/card_option.dart';
import 'package:workout_zone/views/profile/widget/card_profile.dart';
import 'package:workout_zone/views/widgets/custom_outlined_button.dart';
import 'package:workout_zone/views/widgets/cutom_elevated_button.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileSeting extends StatelessWidget {
  const ProfileSeting({
    Key? key,
  }) : super(key: key);

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
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserSuccess) {
                        return CardProfile(
                          nama: state.user.data!.name!,
                          email: state.user.data!.email!,
                          nomor: state.user.data!.phone!,
                        );
                      }
                      return const ShimmerPlaceholder(height: 60, width: 400);
                    },
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
                              fontSize: 14,
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
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignOutLoading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Signing Out ...'),
                        ),
                      );
                  }
                  if (state is UnAuthenticated) {
                    Restart.restartApp();
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Sign Out Success'),
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
                child: CustomOutlinedButton(
                  text: 'Log Out',
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 240,
                            decoration: BoxDecoration(
                              color: kLightColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Are you sure you want to\nLog Out ?",
                                        textAlign: TextAlign.center,
                                        style: AppTheme.theme(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: kSemiBoldWeight,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          context.read<AuthBloc>().add(
                                                SignOutRequest(),
                                              );
                                        },
                                        child: Text(
                                          "Yes, Log Out",
                                          style: AppTheme.theme(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 16,
                                                fontWeight: kSemiBoldWeight,
                                                color: kRedColor,
                                              ),
                                        ),
                                      ),
                                      const HorizontalSpace(width: 10),
                                      CustomElevatedButton(
                                        width: 160,
                                        text: "No",
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
