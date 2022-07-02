import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/user/user_bloc.dart';
import '../../utils/routes/routes.gr.dart';
import '../widgets/shimmer_placeholder.dart';
import '../widgets/vertical_space.dart';
import 'widget/banner_profile.dart';
import 'widget/image_profile.dart';

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
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Column(
                children: [
                  const VerticalSpace(height: 10),
                  ProfileImage(
                    title: state.user.data!.name!,
                  ),
                  const VerticalSpace(height: 20),
                  if (state.user.data!.memberType! == "") const Spacer(),
                  state.user.data!.memberType! == ""
                      ? ElevatedButton.icon(
                          onPressed: () {
                            context.router.push(const MembershipRoute());
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add Membership"),
                        )
                      : BannerProfile(
                          member: state.user.data!.memberType!,
                        ),
                  if (state.user.data!.memberType! == "") const Spacer(),
                ],
              );
            }
            return Center(
              child: Column(
                children: const [
                  VerticalSpace(height: 10),
                  CircleAvatar(
                    radius: 50,
                    child: ShimmerPlaceholder(
                      height: 100,
                      width: 100,
                    ),
                  ),
                  VerticalSpace(height: 10),
                  ShimmerPlaceholder(height: 16, width: 150),
                  VerticalSpace(height: 20),
                  ShimmerPlaceholder(height: 50, width: 200)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
