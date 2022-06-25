import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/views/widgets/payment_button.dart';
import 'package:workout_zone/views/widgets/user_info.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../bloc/user/user_bloc.dart';
import 'widgets/booking_id.dart';
import 'widgets/booking_type.dart';
import 'widgets/membership_type.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const BookingId(bookingId: '12345'),
                const VerticalSpace(height: 20),
                const BookingType(
                  classTitle: 'Boxing',
                  classType: 'Offline',
                  classDate: '22 Juni 2022',
                ),
                const VerticalSpace(height: 20),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSuccess) {
                      return UserInfo(
                        isLoading: false,
                        name: state.user.data!.name!,
                        phone: state.user.data!.phone!,
                        email: state.user.data!.email!,
                      );
                    }
                    return const UserInfo(
                      isLoading: true,
                      name: '',
                      phone: '',
                      email: '',
                    );
                  },
                ),
                const VerticalSpace(height: 20),
                const MembershipType(
                  memberType: 'Gold',
                ),
              ],
            ),
            PaymentButton(
              elevatedButtonText: 'Continue',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
