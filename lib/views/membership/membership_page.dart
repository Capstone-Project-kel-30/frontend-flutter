import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/membership/membership_bloc.dart';
import '../../models/membership_model.dart';
import '../../utils/routes/routes.gr.dart';
import '../widgets/shimmer_placeholder.dart';
import '../widgets/vertical_space.dart';
import 'widgets/card_info.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  @override
  void initState() {
    super.initState();
    context.read<MembershipBloc>().add(GetMembershipDetail());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: BlocBuilder<MembershipBloc, MembershipState>(
          builder: (context, state) {
            if (state is MembershipError) {
              context.router.replaceAll([
                ErrorRoute(isHome: false),
              ]);
            }
            if (state is MembershipDetailLoaded) {
              return ListView.builder(
                itemCount: state.membership.data!.length,
                itemBuilder: (context, index) {
                  final List<Member> data = state.membership.data!;
                  data.sort((a, b) => a.id!.compareTo(b.id!));
                  final String type = data[index].type!;
                  final String price = data[index].price!.toString();
                  final String description = data[index].description!;
                  return Column(
                    children: [
                      CardInfo(
                        type: type,
                        price: price,
                        onTap: () {
                          context.router.push(
                            MembershipDetailRoute(
                              type: type,
                              price: price,
                              description: description,
                            ),
                          );
                        },
                      ),
                      const VerticalSpace(height: 20),
                    ],
                  );
                },
              );
            }
            return Center(
              child: Column(
                children: const [
                  ShimmerPlaceholder(height: 150, width: 335),
                  VerticalSpace(height: 20),
                  ShimmerPlaceholder(height: 150, width: 335),
                  VerticalSpace(height: 20),
                  ShimmerPlaceholder(height: 150, width: 335),
                  VerticalSpace(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
