import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user/user_bloc.dart';
import '../home/widgets/membership_number.dart';
import 'widgets/member_info.dart';
import '../widgets/payment_button.dart';
import '../widgets/user_info.dart';

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
            PaymentButton(
              elevatedButtonText: 'Continue to Payment',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
