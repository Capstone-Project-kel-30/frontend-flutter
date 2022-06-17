import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  }) : super(key: key);

  final String img, title, startTime, location, type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 125,
      width: 150,
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
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
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
                Row(
                  children: [
                    type == 'offline'
                        ? Image.asset('assets/icons/Location.png')
                        : SvgPicture.asset('assets/icons/Stream.svg'),
                    const HorizontalSpace(width: 3),
                    Text(
                      type == 'offline'
                          ? 'Gym Studio - Bandung'
                          : 'Streaming - $location',
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                fontSize: 10,
                                color: kGreyColor,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
