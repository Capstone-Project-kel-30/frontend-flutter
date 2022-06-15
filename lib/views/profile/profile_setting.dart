import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/profile/widget/card_option.dart';
import 'package:workout_zone/views/profile/widget/card_profile.dart';
import 'package:workout_zone/views/widgets/custom_outlined_button.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileSeting extends StatelessWidget {
  const ProfileSeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nama = "Luis";
    String email = "Luis@gmail.com";
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
                  CardProfile(
                    nama: nama,
                    email: email,
                    nomor: '80808988',
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
              CustomOutlinedButton(
                text: 'log Out',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
