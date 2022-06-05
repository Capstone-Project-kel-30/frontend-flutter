import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                    color: const Color.fromRGBO(134, 134, 134, 1),
                  ),
            ),
            const VerticalSpace(height: 4),
            Text(
              username,
              style: AppTheme.theme(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/Search-Outline.svg'),
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/Bell-Outline.svg'),
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
