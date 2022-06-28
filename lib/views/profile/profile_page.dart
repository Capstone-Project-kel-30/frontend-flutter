import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/bloc/user/user_bloc.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/membership/membership_page.dart';
import 'package:workout_zone/views/profile/widget/banner_profile.dart';
import 'package:workout_zone/views/profile/widget/image_profile.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.router.navigate(
                const ProfileSeting(),
              );
            },
            icon: SvgPicture.asset(
              "assets/icons/Settings.svg",
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return ProfileImage(
                    title: state.user.data!.name!,
                  );
                }
                return const CircleAvatar(
                  child: ShimmerPlaceholder(
                    height: 100,
                    width: 100,
                  ),
                );
              },
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  if (state.user.data!.memberType == "") {
                    return ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MembershipPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add Membership"),
                    );
                  } else {
                    return BannerProfile(
                      member: state.user.data!.memberType!,
                    );
                  }
                }
                return const ShimmerPlaceholder(height: 50, width: 199);
              },
            ),
            const Text('')
          ],
        ),
      ),
    );
  }
}
