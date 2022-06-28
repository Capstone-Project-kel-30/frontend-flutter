import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/location_info.dart';
import 'book_button.dart';
import 'time_start.dart';
import 'trainer_info.dart';

class CardClass extends StatelessWidget {
  const CardClass({
    Key? key,
    required this.onTap,
    required this.classType,
    required this.location,
    required this.title,
    required this.trainer,
    required this.isFull,
    required this.startTime,
  }) : super(key: key);

  final Function() onTap;
  final String classType, location, title, trainer, startTime;
  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 3,
        shadowColor: kLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.theme(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            fontWeight: kSemiBoldWeight,
                          ),
                    ),
                    LocationInfo(classType: classType, location: location),
                    TrainerInfo(trainer: trainer),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TimeStart(time: startTime),
                  BookButton(
                    isFull: isFull,
                    onPressed: onTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
