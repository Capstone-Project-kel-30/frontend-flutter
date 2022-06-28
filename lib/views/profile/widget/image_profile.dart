import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    this.img = "assets/images/Profile.png",
    required this.title,
    this.color = kDarkColor,
    this.press,
  }) : super(key: key);
  final String img;
  final String title;
  final Color? color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalSpace(height: 20),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            maxRadius: 50,
            backgroundColor: kPrimaryColor,
            backgroundImage: AssetImage(img),
          ),
        ),
        const VerticalSpace(height: 10),
        GestureDetector(
          onTap: press,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: kSemiBoldWeight,
              color: color!,
            ),
          ),
        ),
      ],
    );
  }
}
