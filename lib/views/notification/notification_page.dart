import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/bloc/bloc.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/notification/widgets/membership_approved_card.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    context.read<MembershipPaymentBloc>().add(GetMembershipPaymentInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: BlocBuilder<MembershipPaymentBloc, MembershipPaymentState>(
        builder: (context, state) {
          if (state is PaymentRequestSuccess) {
            var data = state.membershipPayment.data;
            if (data == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty-notification.png'),
                    const VerticalSpace(height: 20),
                    Text(
                      'It\'s Empty...for now',
                      style:
                          AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 16,
                                color: HSLColor.fromColor(kGreyColor)
                                    .withLightness(0.4)
                                    .toColor(),
                                fontWeight: kSemiBoldWeight,
                              ),
                    ),
                    const VerticalSpace(height: 5),
                    Text(
                      'Anything important we will notify here.',
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                color: HSLColor.fromColor(kGreyColor)
                                    .withLightness(0.4)
                                    .toColor(),
                              ),
                    )
                  ],
                ),
              );
            }
            return MembershipApprovedCard(membershipPayment: data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
