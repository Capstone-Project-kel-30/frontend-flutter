import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/views/widgets/location_info.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/vertical_space.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    Key? key,
    required this.img,
    required this.title,
    required this.startTime,
    required this.location,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  final String img, title, startTime, location, type;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        height: 125,
        width: 150,
        child: Card(
          margin: EdgeInsets.zero,
          color: kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          shadowColor: kLightColor,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                  height: 70,
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: AppTheme.theme(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: kDarkColor.withAlpha(175),
                                  fontWeight: kSemiBoldWeight,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const HorizontalSpace(width: 5),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2.5,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/Clock.svg'),
                                const HorizontalSpace(width: 3),
                                Text(
                                  startTime,
                                  style: AppTheme.theme(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        color: kGreyColor,
                                        fontWeight: kMediumWeight,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(height: 5),
                    LocationInfo(classType: type),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
