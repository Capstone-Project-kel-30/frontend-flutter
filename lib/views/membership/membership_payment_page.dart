import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import '../../bloc/bloc.dart';
import '../../models/membership_payment_model.dart';
import 'widgets/membership_id.dart';
import '../widgets/payment_button.dart';
import '../widgets/user_info.dart';
import 'widgets/member_info.dart';

class MembershipPaymentPage extends StatelessWidget {
  const MembershipPaymentPage({Key? key, required this.membershipPayment})
      : super(key: key);

  final MembershipPaymentModel membershipPayment;

  void launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                MembershipId(membershipPayment: membershipPayment),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MemberTypeInfo(
                    type: membershipPayment.data!.membership!.type!,
                    price:
                        membershipPayment.data!.membership!.price!.toString(),
                  ),
                ),
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
                    if (state is UserGetFailed) {
                      context.read<UserBloc>().add(GetUserProfile());
                    }
                    return const UserInfo(
                      isLoading: true,
                      name: '',
                      phone: '',
                      email: '',
                    );
                  },
                ),
              ],
            ),
            PaymentButton(
              elevatedButtonText: 'Continue to Payment',
              onPressed: () {
                launchURL(membershipPayment.data!.snapUrl!);
                context.router.replaceAll([const HomeWrapper()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
