import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import '../../bloc/bloc.dart';
import '../../utils/common/constant.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/image_carousel.dart';
import 'widgets/membership_description.dart';
import 'widgets/membership_info.dart';

class MembershipDetailPage extends StatelessWidget {
  MembershipDetailPage({
    Key? key,
    required this.type,
    required this.price,
    required this.description,
  }) : super(key: key);

  final String type, price, description;

  final List<String> imgList = [
    'assets/images/dummy1.png',
    'assets/images/dummy2.jpg',
    'assets/images/dummy3.jpg',
  ];

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
          ImageCarousel(imgList: imgList),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20),
                        child: MembershipInfo(
                          type: type,
                          price: price,
                        ),
                      ),
                      MembershipDescription(
                        description: description,
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
                              content: Text("Loading ..."),
                            ),
                          );
                      }
                      if (state is PaymentRequestSuccess) {
                        context.router.replaceAll([
                          MembershipPaymentRoute(
                            membershipPayment: state.membershipPayment,
                          )
                        ]);
                      }
                      if (state is PaymentRequestError) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(state.msg),
                            ),
                          );
                      }
                    },
                    child: CustomElevatedButton(
                      text: 'Join Membership',
                      onPressed: () {
                        final int membershipId = getMembershipId(type);
                        context
                            .read<MembershipPaymentBloc>()
                            .add(MembershipRegisterRequest(membershipId));
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
