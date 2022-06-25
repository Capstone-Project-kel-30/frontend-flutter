import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: kPrimaryColor),
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/Filter.svg'),
                const HorizontalSpace(width: 12),
                Text(
                  text,
                  style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                        fontWeight: kSemiBoldWeight,
                        color: kGreyColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
