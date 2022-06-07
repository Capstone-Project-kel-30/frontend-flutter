import 'package:flutter/material.dart';
import 'package:workout_zone/views/home/widgets/membership_number.dart';
import 'package:workout_zone/views/membership/widgets/member_info.dart';
import 'package:workout_zone/views/membership/widgets/user_info.dart';

import 'widgets/membership_payment_button.dart';

class MembershipPaymentPage extends StatelessWidget {
  const MembershipPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership Payment'),
      ),
      body: Column(
        children: [
          Column(
            children: const [
              MembershipNumber(membershipNumber: '1234567'),
              MemberTypeInfo(type: 'Gold', price: '990.000'),
              UserInfo(),
            ],
          ),
          const MembershipPaymentButton(),
        ],
      ),
    );
  }
}
