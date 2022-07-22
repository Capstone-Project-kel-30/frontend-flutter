import 'package:flutter/material.dart';
import 'package:workout_zone/models/user_model.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/vertical_space.dart';

class TransactionSuccessCard extends StatelessWidget {
  const TransactionSuccessCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 100,
        child: Card(
          child: Row(
            children: [
              const HorizontalSpace(width: 20),
              Image.asset('assets/images/credit_card.png'),
              const HorizontalSpace(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction was successful!',
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                color: kDarkColor,
                                fontWeight: kSemiBoldWeight,
                              ),
                    ),
                    const VerticalSpace(height: 5),
                    Text(
                      "Payment on behalf of ${user.name} has been successful and our Membership is being processed. Please wait for further notification.",
                      style: AppTheme.theme(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
