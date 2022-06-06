import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import '../../utils/themes/app_theme.dart';
import '../widgets/vertical_space.dart';
import 'widgets/member_card.dart';

class MembershipPage extends StatelessWidget {
  MembershipPage({Key? key}) : super(key: key);

  final List<String> assetList = [
    'assets/images/gold_member_card.png',
    'assets/images/silver_member_card.png',
    'assets/images/bronze_member_card.png',
  ];

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
        child: Column(
          children: [
            MemberCard(
              asset: assetList[0],
              type: types[0],
              price: prices[0],
              colors: const [kGold, kGold2, kGold],
              onTap: () {
                context.router.push(const MembershipDetailRoute());
              },
            ),
            const VerticalSpace(height: 20),
            MemberCard(
              asset: assetList[1],
              type: types[1],
              price: prices[1],
              colors: const [kSilver, kSilver2, kSilver],
              onTap: () {
                context.router.push(const MembershipDetailRoute());
              },
            ),
            const VerticalSpace(height: 20),
            MemberCard(
              asset: assetList[2],
              type: types[2],
              price: prices[2],
              colors: const [kBronze, kBronze2, kBronze],
              onTap: () {
                context.router.push(const MembershipDetailRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
