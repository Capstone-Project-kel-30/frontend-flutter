import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/class/widgets/trainer_info.dart';
import 'package:workout_zone/views/schedule/widget/select_picker.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/location_info.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({
    Key? key,
    this.classType,
  }) : super(key: key);
  final String? classType;

  int ind = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SelectPicker(
                onprees: (int index) {
                  ind = index;
                },
              ),
              const VerticalSpace(height: 10),
              CardJadwal(
                classType: "offline",
                location: "offline" == 'online'
                    ? 'Streaming - Zoom'
                    : 'Gym Studio - Bandung',
                index: ind,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardJadwal extends StatelessWidget {
  const CardJadwal({
    Key? key,
    required this.classType,
    required this.location,
    required int index,
  }) : super(key: key);

  final String classType, location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 71,
      width: double.infinity,
      child: Card(
        color: kLightColor,
        shadowColor: kGreyColor,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilates",
                    style:
                        AppTheme.theme(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14,
                              fontWeight: kSemiBoldWeight,
                            ),
                  ),
                  LocationInfo(
                    classType: classType,
                    location: location,
                  ),
                  const TrainerInfo(trainer: 'trainer')
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 22,
                    width: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kPrimaryColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Clock.svg",
                        ),
                        const HorizontalSpace(width: 4),
                        Text("data")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
