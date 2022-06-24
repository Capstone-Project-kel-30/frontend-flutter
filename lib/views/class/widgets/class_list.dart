import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/location_info.dart';
import 'book_button.dart';
import 'time_start.dart';
import 'trainer_info.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
    required this.index,
    required this.classType,
    required this.location,
  }) : super(key: key);

  final int index;
  final String classType, location;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: index,
      itemBuilder: (context, idx) {
        return SizedBox(
          height: 71,
          child: Card(
            elevation: 3,
            shadowColor: kLightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Body Camp',
                        style: AppTheme.theme(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: kSemiBoldWeight,
                            ),
                      ),
                      LocationInfo(classType: classType, location: location),
                      const TrainerInfo(trainer: 'trainer'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TimeStart(time: '16:00'),
                      BookButton(
                        isFull: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
