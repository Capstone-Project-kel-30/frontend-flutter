import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/bloc.dart';
import '../../utils/common/constant.dart';
import '../home/widgets/membership_number.dart';
import '../widgets/payment_button.dart';
import '../widgets/user_info.dart';
import 'widgets/member_info.dart';

class MembershipPaymentPage extends StatelessWidget {
  const MembershipPaymentPage({
    Key? key,
    required this.type,
    required this.price,
  }) : super(key: key);

  final String type, price;

  void launchURL(String url) async {
    var uri = Uri.parse(url);
    debugPrint(uri.toString());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  int getMembershipId(String type) {
    if (type == goldMember) {
      return 1;
    } else if (type == silverMember) {
      return 2;
    } else if (type == bronzeMember) {
      return 3;
    } else {
      return -1;
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
                const MembershipNumber(membershipNumber: '1234567'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MemberTypeInfo(type: type, price: price),
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
            BlocListener<MembershipPaymentBloc, MembershipPaymentState>(
              listener: (context, state) {
                if (state is PaymentLoading) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 5),
                        content: Text('Loading ...'),
                      ),
                    );
                }
                if (state is PaymentRequestSuccess) {
                  launchURL(state.membershipPayment.data!.snapUrl!);
                  // TODO: Notifications
                }
                if (state is PaymentRequestError) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar
                    ..showSnackBar(
                      SnackBar(
                        content: Text(state.msg),
                      ),
                    );
                }
              },
              child: PaymentButton(
                elevatedButtonText: 'Continue to Payment',
                onPressed: () {
                  final int membershipId = getMembershipId(type);
                  context.read<MembershipPaymentBloc>().add(
                        MembershipRegisterRequest(membershipId),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
