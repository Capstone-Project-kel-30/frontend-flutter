import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/class/widgets/trainer_info.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/location_info.dart';

class CardClass extends StatelessWidget {
  const CardClass({Key? key, required this.classType}) : super(key: key);
  final String classType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        classType == "Online"
            ? context.router.push(
                ClassRoute(classType: "Online"),
              )
            : context.router.push(
                ClassRoute(classType: "Offline"),
              );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Silat",
                    style:
                        AppTheme.theme(context).textTheme.bodySmall!.copyWith(
                              fontWeight: kSemiBoldWeight,
                              fontSize: 16,
                            ),
                  ),
                  LocationInfo(
                    classType: classType,
                    location: classType == ''
                        ? 'Streaming - Zoom'
                        : 'Gym Studio - Bandung',
                  ),
                  const TrainerInfo(trainer: "trainer"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/Clock.svg"),
                        const HorizontalSpace(width: 2.5),
                        Text(
                          "12.00",
                          style: AppTheme.theme(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                fontWeight: kSemiBoldWeight,
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Text("")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
