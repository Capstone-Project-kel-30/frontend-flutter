import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class CardOption extends StatelessWidget {
  const CardOption({
    Key? key,
    required this.title,
    required this.asset,
  }) : super(key: key);
  final String title, asset;

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
            minLeadingWidth: 0,
            leading: SvgPicture.asset(asset),
            title: Text(
              title,
              style: AppTheme.theme(context).textTheme.labelMedium!.copyWith(
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
            trailing: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
