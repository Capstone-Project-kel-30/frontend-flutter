import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import '../../utils/themes/app_theme.dart';
import 'widgets/membership_description.dart';
import 'widgets/membership_image_carousel.dart';
import 'widgets/membership_info.dart';

class MembershipDetailPage extends StatelessWidget {
  MembershipDetailPage({Key? key}) : super(key: key);
  final List<String> imgList = [
    'assets/images/dummy1.png',
    'assets/images/dummy2.jpg',
    'assets/images/dummy3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Details Membership',
          style: TextStyle(
            fontSize: 18,
            fontWeight: kSemiBoldWeight,
            color: kLightColor,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MembershipImageCarousel(imgList: imgList),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 20),
                        child: MembershipInfo(),
                      ),
                      MembershipDescription(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('Join Membership'),
                        onPressed: () {
                          context.router.push(const MembershipPaymentRoute());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
