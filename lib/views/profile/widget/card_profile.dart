import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    Key? key,
    required this.nama,
    this.email,
    this.nomor,
    this.profilpic = "assets/images/Profile.png",
  }) : super(key: key);

  final String? nama, email, nomor;
  final String profilpic;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1.1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: kDarkColor,
                ),
                children: [
                  TextSpan(
                    text: '$nama\n',
                    style:
                        AppTheme.theme(context).textTheme.titleSmall!.copyWith(
                              fontWeight: kSemiBoldWeight,
                            ),
                  ),
                  TextSpan(
                    text: email,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: kRegularWeight, height: 2),
                  )
                ],
              ),
            ),
            subtitle: Text(
              "$nomor",
              style: const TextStyle(
                fontSize: 10,
                fontWeight: kRegularWeight,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                context.router.push(const ProfileEdit());
              },
              icon: SvgPicture.asset(
                "assets/icons/Edit.svg",
                width: 20,
              ),
            ),
            leading: Image(
              image: AssetImage(
                profilpic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
