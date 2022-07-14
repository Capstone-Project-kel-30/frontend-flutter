import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

import '../../../models/class_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/routes/routes.gr.dart';
import '../../class/widgets/class_card.dart';

class CustomSearchDelegate extends SearchDelegate<Class> {
  final List<Class> classes;
  final UserModel user;

  CustomSearchDelegate({required this.classes, required this.user});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('cancel'),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SvgPicture.asset(
        'assets/icons/Search-Outline.svg',
        color: kGreyColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Class> classList = [];
    classList = classes
        .where((e) => e.classname!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return classList.isNotEmpty
        ? ListView.builder(
            padding: const EdgeInsets.all(10),
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
        : const Center(
            child: Text('No Class Found'),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search any class'),
    );
  }
}
