import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/time_widget.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class CardJadwal extends StatelessWidget {
  const CardJadwal({
    Key? key,
    required this.title1,
    required this.title3,
    required this.logo,
    required this.starttime,
    required this.title2,
  }) : super(key: key);
  final String title1, title2, title3, logo, starttime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kLightColor),
      padding: const EdgeInsets.only(right: 10),
      width: 335,
      height: 71,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: AppTheme.theme(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: kSemiBoldWeight,
                      wordSpacing: 1.0,
                      height: 1.8),
                ),
                const VerticalSpace(height: 5),
                Row(
                  children: [
                    Image.asset(logo),
                    const HorizontalSpace(width: 7.5),
                    Text(
                      title2,
                      style:
                          AppTheme.theme(context).textTheme.caption!.copyWith(
                                fontWeight: kRegularWeight,
                                height: 1.2,
                              ),
                    ),
                  ],
                ),
                const VerticalSpace(height: 5),
                Row(
                  children: [
                    Image.asset('assets/icons/coach 1.png'),
                    const HorizontalSpace(width: 7.5),
                    Text(
                      title3,
                      style:
                          AppTheme.theme(context).textTheme.caption!.copyWith(
                                fontWeight: kRegularWeight,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TimeWidget(
            startTime: starttime,
          ),
        ],
      ),
    );
  }
}
