import 'package:flutter/material.dart';

import '../home/widgets/membership_number.dart';
import 'widgets/member_info.dart';
import 'widgets/membership_payment_button.dart';
import 'widgets/user_info.dart';

class MembershipPaymentPage extends StatelessWidget {
  const MembershipPaymentPage({
    Key? key,
    required this.type,
    required this.price,
  }) : super(key: key);

  final String type, price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                const UserInfo(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: MembershipPaymentButton(),
            ),
          ],
        ),
      ),
    );
  }
}
