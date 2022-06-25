import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../../utils/themes/app_theme.dart';

class BookingType extends StatelessWidget {
  const BookingType({
    Key? key,
    required this.classTitle,
    required this.classType,
    required this.classDate,
  }) : super(key: key);

  final String classTitle, classType, classDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Type',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 5),
        Card(
          color: kBackgroundColor,
          shadowColor: kLightColor,
          elevation: 3,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classTitle,
                      style: AppTheme.theme(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            fontWeight: kSemiBoldWeight,
                          ),
                    ),
                    const VerticalSpace(height: 5),
                    classType == 'Online'
                        ? Row(
                            children: [
                              SizedBox(
                                height: 7.5,
                                width: 12,
                                child: SvgPicture.asset(
                                  'assets/icons/Online-class.svg',
                                ),
                              ),
                              const HorizontalSpace(width: 5),
                              Text(
                                'Online class',
                                style: AppTheme.theme(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 10,
                                    ),
                              )
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                height: 7.5,
                                width: 12,
                                child: SvgPicture.asset(
                                    'assets/icons/Offline-class.svg'),
                              ),
                              const HorizontalSpace(width: 5),
                              Text(
                                'Offline class',
                                style: AppTheme.theme(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 10,
                                    ),
                              )
                            ],
                          )
                  ],
                ),
                Text(
                  classDate,
                  style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                        fontWeight: kSemiBoldWeight,
                        color: kPrimaryColor,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
