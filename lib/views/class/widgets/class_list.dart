import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/models/class_model.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

import 'class_card.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
    required this.classList,
    required this.user,
  }) : super(key: key);

  final List<Class> classList;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return classList.isNotEmpty
        ? ListView.builder(
            itemCount: classList.length,
            itemBuilder: (context, idx) {
              return CardClass(
                classType: classList[idx].clastype!.toUpperCase(),
                isFull: classList[idx].status! != 'Available',
                title: classList[idx].classname!,
                trainer: classList[idx].trainer!,
                startTime: classList[idx].clock!,
                onTap: () {
                  context.router.push(
                    ClassDetailRoute(
                      user: user,
                      classes: classList[idx],
                      fromSchedule: false,
                    ),
                  );
                },
              );
            },
          )
        : Center(
            child: Text(
              "No Available Class on This Date",
              style: AppTheme.theme(context).textTheme.titleLarge?.copyWith(
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
          );
  }
}
