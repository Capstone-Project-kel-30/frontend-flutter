import 'package:flutter/material.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/schedule/widget/card_class.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class JadwalCard extends StatelessWidget {
  const JadwalCard({
    Key? key,
    required this.user,
    required this.classList,
  }) : super(key: key);
  final UserModel user;
  final List<Map<String, dynamic>> classList;

  @override
  Widget build(BuildContext context) {
    return classList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Calendar.png'),
              const VerticalSpace(height: 20),
              Text(
                "No Booking Schedule Yet",
                style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: kSemiBoldWeight,
                      color: kPrimaryColor,
                    ),
              )
            ],
          )
        : ListView.builder(
            itemCount: classList.length,
            itemBuilder: (BuildContext context, int idx) {
              return CardClass(
                classTitle: classList[idx]["classTitle"],
                classType: classList[idx]["classType"],
                user: user,
                location: classList[idx]["location"],
                trainer: classList[idx]["trainer"],
                startTime: classList[idx]["startTime"],
              );
            },
          );
  }
}
