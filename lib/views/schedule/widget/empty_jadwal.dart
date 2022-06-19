import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class EmptyJadwal extends StatelessWidget {
  const EmptyJadwal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Image(
            image: AssetImage(
              "assets/images/Calendar.png",
            ),
          ),
          const VerticalSpace(height: 10),
          Text(
            "No booking schedule yet",
            style: AppTheme.theme(context).textTheme.labelLarge!.copyWith(
                  fontWeight: kSemiBoldWeight,
                  color: kPrimaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
