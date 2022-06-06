import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.asset,
    required this.type,
    required this.price,
    required this.colors,
    required this.onTap,
  }) : super(key: key);

  final String asset, type, price;
  final List<Color> colors;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
          ),
        ),
        Positioned.fill(
          bottom: 15,
          left: 15,
          right: 15,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: kSemiBoldWeight,
                  ),
                ),
                Text(
                  'Rp $price',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: kSemiBoldWeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
