import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../models/class_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/routes/routes.gr.dart';
import 'class_card.dart';

class ClassContent extends StatelessWidget {
  const ClassContent({
    Key? key,
    required this.classes,
    required this.user,
  }) : super(key: key);

  final List<Class> classes;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: classes.length > 5 ? 5 : classes.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClassCard(
            selectedClass: classes[index],
            onTap: () {
              context.router.push(
                ClassDetailRoute(
                  user: user,
                  classes: classes[index],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
