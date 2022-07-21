import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../../models/class_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/routes/routes.gr.dart';
import '../../../utils/themes/app_theme.dart';
import '../../class/widgets/trainer_info.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/location_info.dart';

class CardClass extends StatelessWidget {
  const CardClass({
    Key? key,
    required this.classes,
    required this.user,
  }) : super(key: key);
  final UserModel user;
  final Class classes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          ClassDetailRoute(
            classes: classes,
            user: user,
            fromSchedule: true,
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classes.classname!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTheme.theme(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: kSemiBoldWeight,
                              ),
                    ),
                    const VerticalSpace(height: 5),
                    LocationInfo(classType: classes.clastype!),
                    const VerticalSpace(height: 5),
                    TrainerInfo(trainer: classes.trainer!),
                  ],
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/Clock.svg"),
                      const HorizontalSpace(width: 2.5),
                      Text(
                        classes.clock!,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
