import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import 'class_card.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
    required this.classList,
    required this.user,
  }) : super(key: key);

  final List<Map<String, dynamic>> classList;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: classList.length,
      itemBuilder: (context, idx) {
        return CardClass(
          classType: classList[idx]["classType"]!,
          location: classList[idx]["location"]!,
          isFull: classList[idx]["isFull"]!,
          title: classList[idx]["title"]!,
          trainer: classList[idx]["trainer"]!,
          startTime: classList[idx]["startTime"]!,
          onTap: () {
            context.router.push(
              ClassDetailRoute(
                user: user,
                classType: classList[idx]["classType"],
              ),
            );
          },
        );
      },
    );
  }
}
