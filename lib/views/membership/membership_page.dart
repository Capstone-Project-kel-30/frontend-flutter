import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/vertical_space.dart';
import 'widgets/card_info.dart';

class MembershipPage extends StatelessWidget {
  MembershipPage({Key? key}) : super(key: key);

  final List<String> types = ['Gold', 'Silver', 'Bronze'];

  final List<String> prices = ['990.000', '599.000', '299.000'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CardInfo(
                  type: types[0],
                  price: prices[0],
                  onTap: () {
                    context.router.push(MembershipDetailRoute(
                      type: types[0],
                      price: prices[0],
                    ));
                  },
                ),
                const VerticalSpace(height: 20),
                CardInfo(
                  type: types[1],
                  price: prices[1],
                  onTap: () {
                    context.router.push(MembershipDetailRoute(
                      type: types[1],
                      price: prices[1],
                    ));
                  },
                ),
                const VerticalSpace(height: 20),
                CardInfo(
                  type: types[2],
                  price: prices[2],
                  onTap: () {
                    context.router.push(MembershipDetailRoute(
                      type: types[2],
                      price: prices[2],
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
