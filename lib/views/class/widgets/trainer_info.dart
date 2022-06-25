import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';

class TrainerInfo extends StatelessWidget {
  const TrainerInfo({Key? key, required this.trainer}) : super(key: key);

  final String trainer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/Trainer.png'),
        const HorizontalSpace(width: 5),
        Text(
          trainer,
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: kGreyColor,
              ),
        ),
      ],
    );
  }
}
