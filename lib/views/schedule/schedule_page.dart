import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../models/class_model.dart';
import '../../models/user_model.dart';
import '../../utils/routes/routes.gr.dart';
import '../widgets/shimmer_placeholder.dart';
import '../widgets/vertical_space.dart';
import 'widget/card_jadwal.dart';
import 'widget/select_picker.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int ind = 0;
  List<Class> allClass = [];

  @override
  void initState() {
    super.initState();
    context.read<ScheduleBloc>().add(GetSchedule());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    final user = state.user.data;
                    return Visibility(
                      visible: user!.memberType! != "",
                      child: SelectPicker(
                        onprees: (String selectedType) {
                          context.read<ScheduleBloc>().add(
                                FilterSchedule(
                                  (e) {
                                    if (selectedType == 'All') {
                                      return true;
                                    }
                                    return e.clastype!.toUpperCase() ==
                                        selectedType.toUpperCase();
                                  },
                                  allClass,
                                ),
                              );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const VerticalSpace(height: 20),
              Expanded(
                child: Center(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserSuccess) {
                        final UserModel user = state.user;
                        if (user.data!.memberType! == "") {
                          return FittedBox(
                            fit: BoxFit.scaleDown,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                context.router.push(const MembershipRoute());
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add Membership"),
                            ),
                          );
                        }
                        return BlocBuilder<ScheduleBloc, ScheduleState>(
                          builder: (context, scheduleState) {
                            if (scheduleState is ScheduleLoaded) {
                              final List<Class> classes =
                                  scheduleState.scheduleInfo.data!.classes!;
                              allClass = classes;
                              return JadwalCard(
                                classList: classes,
                                user: state.user,
                              );
                            }
                            if (scheduleState is FilteredSchedule) {
                              final List<Class> filteredClass =
                                  scheduleState.filteredClass;
                              return JadwalCard(
                                classList: filteredClass,
                                user: state.user,
                              );
                            }
                            if (scheduleState is ScheduleError) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Unable to Fetch Data'),
                                    IconButton(
                                      icon: const Icon(Icons.restart_alt),
                                      onPressed: () {
                                        context
                                            .read<ScheduleBloc>()
                                            .add(GetSchedule());
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                            return ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Column(
                                    children: const [
                                      ShimmerPlaceholder(
                                        height: 71,
                                        width: double.infinity,
                                      ),
                                      VerticalSpace(height: 10),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
