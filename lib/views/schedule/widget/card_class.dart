import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/models/class_model.dart';

import '../../../models/user_model.dart';
import '../../../utils/routes/routes.gr.dart';
import '../../../utils/themes/app_theme.dart';
import '../../class/widgets/trainer_info.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/location_info.dart';

class CardClass extends StatelessWidget {
  const CardClass({
    Key? key,
    required this.classType,
    required this.user,
    required this.location,
    required this.trainer,
    required this.startTime,
    required this.classTitle,
  }) : super(key: key);
  final String classType, location, trainer, startTime, classTitle;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          ClassDetailRoute(
            classes: Class(
              classname: classTitle,
              clastype: classType,
              trainer: trainer,
              clock: startTime,
              description:
                  'Qui labore labore sunt reprehenderit velit. Pariatur culpa quis ea proident ut nulla ipsum. Laborum aliquip laborum excepteur cupidatat fugiat fugiat sint consectetur deserunt.',
              date: '22-20-2022',
              status: 'Available',
              duration: 60,
            ),
            user: user,
          ),
        );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
                      classTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTheme.theme(context).textTheme.bodyLarge!.copyWith(
                                fontWeight: kSemiBoldWeight,
                              ),
                    ),
                    LocationInfo(classType: classType),
                    TrainerInfo(trainer: trainer),
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
                        startTime,
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
