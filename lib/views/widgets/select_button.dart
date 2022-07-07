import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/common/helper.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    required this.title,
    required this.isActive,
    required this.ontap,
    required this.logo,
  }) : super(key: key);

  final String? title, logo;
  final bool isActive;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 35,
        width: 91,
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kLightColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? kLightColor : kPrimaryColor,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (logo != "")
                SvgPicture.asset(
                  logo!,
                  color: isActive ? kLightColor : kPrimaryColor,
                  height: 20,
                ),
              const HorizontalSpace(width: 5),
              Text(
                capitalize(title!),
                style: AppTheme.theme(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                      fontWeight: kSemiBoldWeight,
                      color: isActive ? kLightColor : kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
