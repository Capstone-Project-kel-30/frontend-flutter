import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import 'widgets/cutom_elevated_button.dart';
import 'widgets/membership_description.dart';
import 'widgets/membership_image_carousel.dart';
import 'widgets/membership_info.dart';

class MembershipDetailPage extends StatelessWidget {
  MembershipDetailPage({
    Key? key,
    required this.type,
    required this.price,
  }) : super(key: key);

  final String type, price;

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
        title: Text(
          'Details Membership',
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: kLightColor,
                fontWeight: kSemiBoldWeight,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20),
                        child: MembershipInfo(
                          type: type,
                          price: price,
                        ),
                      ),
                      MembershipDescription(
                        type: type,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: CustomElevatedButton(
                      text: 'Join Membership',
                      onPressed: () {
                        context.router.push(MembershipPaymentRoute(
                          type: type,
                          price: price,
                        ));
                      },
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
