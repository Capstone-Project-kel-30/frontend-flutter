import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../../utils/themes/app_theme.dart';

class FacilityBadge extends StatelessWidget {
  const FacilityBadge({
    Key? key,
    required this.facility,
    required this.asset,
  }) : super(key: key);

  final String facility, asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          width: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kGreyColor),
            ),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(asset),
              ),
            ),
          ),
        ),
        const VerticalSpace(height: 5),
        Text(
          facility,
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: kDarkColor,
              ),
        ),
      ],
    );
  }
}
