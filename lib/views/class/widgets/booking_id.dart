import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class BookingId extends StatelessWidget {
  const BookingId({Key? key, required this.bookingId}) : super(key: key);

  final String bookingId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Booking ID',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        Text(
          bookingId,
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                fontWeight: kSemiBoldWeight,
                color: kPrimaryColor,
              ),
        ),
      ],
    );
  }
}
