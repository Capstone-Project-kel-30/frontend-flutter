import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    this.img = "assets/images/Profile.png",
    this.title,
  }) : super(key: key);
  final String img;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            maxRadius: 50,
            backgroundColor: kPrimaryColor,
            backgroundImage: AssetImage(img),
          ),
        ),
        const VerticalSpace(height: 10),
        title != null
            ? Text(
                title!,
                style: const TextStyle(
                  fontWeight: kSemiBoldWeight,
                  fontSize: 16,
                  color: kDarkColor,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
