import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/bloc/bloc.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/notification/widgets/membership_approved_card.dart';
import 'package:workout_zone/views/notification/widgets/transaction_success_card.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../models/user_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key, required this.user}) : super(key: key);

  final User user;

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
            return Column(
              children: [
                const VerticalSpace(height: 20),
                TransactionSuccessCard(
                  user: widget.user,
                ),
                const VerticalSpace(height: 10),
                MembershipApprovedCard(membershipPayment: data),
              ],
            );
          }
          if (state is PaymentRequestError) {
            if (state.msg == "record not found") {
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Unable to Fetch Data',
                    textAlign: TextAlign.center,
                    style:
                        AppTheme.theme(context).textTheme.titleLarge?.copyWith(
                              fontWeight: kBoldWeight,
                            ),
                  ),
                  const VerticalSpace(height: 20),
                  IconButton(
                    icon: const Icon(Icons.restart_alt),
                    onPressed: () {
                      context
                          .read<MembershipPaymentBloc>()
                          .add(GetMembershipPaymentInfo());
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
