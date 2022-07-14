import 'package:flutter/material.dart';

import '../../../models/class_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';
import 'card_class.dart';

class JadwalCard extends StatelessWidget {
  const JadwalCard({
    Key? key,
    required this.user,
    required this.classList,
  }) : super(key: key);
  final UserModel user;
  final List<Class> classList;

  @override
  Widget build(BuildContext context) {
    return classList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Calendar.png'),
              const VerticalSpace(height: 20),
              Text(
                "No Booking Schedule Yet",
                style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: kSemiBoldWeight,
                      color: kPrimaryColor,
                    ),
              )
            ],
          )
        : ListView.builder(
            itemCount: classList.length,
            itemBuilder: (BuildContext context, int idx) {
              return CardClass(
                classes: classList[idx],
                user: user,
              );
            },
          );
  }
}
