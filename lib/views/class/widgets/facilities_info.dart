import 'package:flutter/material.dart';
import 'package:workout_zone/views/class/widgets/facility_badge.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class FacilitiesInfo extends StatelessWidget {
  const FacilitiesInfo({Key? key, required this.facilities}) : super(key: key);

  final List<String> facilities;

  String getAsset(String facility) {
    if (facility == 'Parking area') {
      return 'assets/icons/Parking-area.png';
    } else if (facility == 'Gloves') {
      return 'assets/icons/Gloves.png';
    } else if (facility == 'Shower') {
      return 'assets/icons/Shower.png';
    } else if (facility == 'Towel') {
      return 'assets/icons/Towel.png';
    } else if (facility == 'Locker') {
      return 'assets/icons/Locker.png';
    } else if (facility == 'Bottle') {
      return 'assets/icons/Bottle.png';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facilities',
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 10),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: facilities.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FacilityBadge(
                  asset: getAsset(facilities[index]),
                  facility: facilities[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
