import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

import '../../../models/class_model.dart';

class CustomSearchDelegate extends SearchDelegate<Class> {
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
      padding: const EdgeInsets.all(14),
      child: SvgPicture.asset(
        'assets/icons/Search-Outline.svg',
        color: kGreyColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search any class'),
    );
  }
}
