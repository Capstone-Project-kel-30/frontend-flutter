import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/bloc/user/user_bloc.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/profile/widget/image_profile.dart';
import 'package:workout_zone/views/widgets/member_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, this.type}) : super(key: key);

  final String? type;
  String setBenefit(type) {
    if (type == 'Gold') {
      return 'Gold';
    } else if (type == 'Silver') {
      return 'Silver';
    } else {
      return 'Bronze';
    }
  }

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
              context.router.push(const ProfileSeting());
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
                return const ProfileImage(
                  title: "Kosong",
                );
              },
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Visibility(
                      visible: state.user.data!.memberType == '',
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text("Add Membership"),
                      ));
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kSecondaryColor,
                  ),
                  height: 50,
                  width: 199,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MemberCard(
                          height: 30,
                          width: 40,
                          type: "state.user.data!.memberType!",
                        ),
                        Text(
                          "",
                          style: AppTheme.theme(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: kPrimaryColor,
                                fontWeight: kSemiBoldWeight,
                              ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const Text('')
          ],
        ),
      ),
    );
  }
}
