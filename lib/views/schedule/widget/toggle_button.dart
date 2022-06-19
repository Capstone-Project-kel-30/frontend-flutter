import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    Key? key,
    required this.isActive,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final bool isActive;
  final Function() onPressed;
  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Wrap(
              children: [
                SvgPicture.asset(
                  icon,
                  color: kLightColor,
                ),
                const HorizontalSpace(width: 5),
                Text(
                  text,
                  style: AppTheme.theme(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(height: 1.6, color: kLightColor),
                )
              ],
            ),
          )
        : OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Wrap(
              children: [
                SvgPicture.asset(
                  icon,
                ),
                const HorizontalSpace(width: 5),
                Text(
                  text,
                  style: AppTheme.theme(context).textTheme.labelLarge!.copyWith(
                        height: 1.6,
                        color: kPrimaryColor,
                      ),
                ),
              ],
            ),
          );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            onPressed: onPressed,
            child: const Text("All"))
        : OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            onPressed: onPressed,
            child: const Text("All"));
  }
}
