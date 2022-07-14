import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone/models/membership_model.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/widgets/custom_network_image.dart';

import '../../bloc/bloc.dart';
import '../../utils/common/constant.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/cutom_elevated_button.dart';
import 'widgets/membership_description.dart';
import 'widgets/membership_info.dart';

class MembershipDetailPage extends StatelessWidget {
  MembershipDetailPage({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member member;

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
          CustomNetworkImage(
            link: member.img!,
            color: kGreyColor,
            height: 280,
            width: double.infinity,
          ),
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
                            type: member.type!,
                            price: member.price!.toString()),
                      ),
                      MembershipDescription(
                        description: member.description!,
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
                        final int membershipId = member.id!;
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
