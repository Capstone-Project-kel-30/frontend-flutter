import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class MemberCard extends StatelessWidget {
  MemberCard({
    Key? key,
    required this.height,
    required this.width,
    required this.type,
  }) : super(key: key);

  final String type;
  final double height, width;

  final List<String> assetList = [
    'assets/images/gold_member_card.png',
    'assets/images/silver_member_card.png',
    'assets/images/bronze_member_card.png',
  ];

  final List<List<Color>> colorList = [
    [kGold, kGold2, kGold],
    [kSilver, kSilver2, kSilver],
    [kBronze, kBronze2, kBronze],
  ];

  List<Color> setColor(type) {
    if (type == 'Gold') {
      return colorList[0];
    } else if (type == 'Silver') {
      return colorList[1];
    } else {
      return colorList[2];
    }
  }

  String setAsset(type) {
    if (type == 'Gold') {
      return assetList[0];
    } else if (type == 'Silver') {
      return assetList[1];
    } else {
      return assetList[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = setColor(type);
    final asset = setAsset(type);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          asset,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
