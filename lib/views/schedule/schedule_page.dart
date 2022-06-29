import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../utils/common/constant.dart';
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
  List<Map<String, dynamic>> onlineClassList = [
    {
      "classTitle":
          "Anim occaecat nisi dolore sit minim sint nisi pariatur sint culpa dolor veniam.",
      "classType": onlineClass,
      "trainer": "trainer",
      "location": "Streaming - Zoom",
      "startTime": "17:00",
    },
    {
      "classTitle": "Silat",
      "classType": onlineClass,
      "trainer": "trainer",
      "location": "Streaming - GMeet",
      "startTime": "23:00",
    },
    {
      "classTitle": "Zumba",
      "classType": onlineClass,
      "trainer": "trainer",
      "location": "Streaming - Youtube",
      "startTime": "05:00",
    },
    {
      "classTitle": "Yoga",
      "classType": onlineClass,
      "trainer": "trainer",
      "location": "Streaming - Zoom",
      "startTime": "21:00",
    },
  ];

  List<Map<String, dynamic>> offlineClassList = [
    // {
    //   "classTitle": "Boxing",
    //   "classType": offlineClass,
    //   "trainer": "trainer",
    //   "location": "Gym Studio - Bandung",
    //   "startTime": "17:00",
    // },
    // {
    //   "classTitle": "Silat",
    //   "classType": offlineClass,
    //   "trainer": "trainer",
    //   "location": "Gym Studio - Bandung",
    //   "startTime": "23:00",
    // },
    // {
    //   "classTitle":
    //       "Quis occaecat id commodo id et quis tempor amet irure consectetur fugiat consequat velit et.",
    //   "classType": offlineClass,
    //   "trainer": "trainer",
    //   "location": "Gym Studio - Bandung",
    //   "startTime": "05:00",
    // },
    // {
    //   "classTitle": "Yoga",
    //   "classType": offlineClass,
    //   "trainer": "trainer",
    //   "location": "Gym Studio - Bandung",
    //   "startTime": "21:00",
    // },
  ];

  List<Map<String, dynamic>> getList(int index) {
    if (index == 0) {
      return [...offlineClassList, ...onlineClassList];
    } else if (index == 1) {
      return offlineClassList;
    } else {
      return onlineClassList;
    }
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
              SelectPicker(
                onprees: (int index) {
                  ind = index;
                  setState(() {});
                },
              ),
              const VerticalSpace(height: 20),
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserSuccess) {
                      return JadwalCard(
                        classList: getList(ind),
                        user: state.user,
                      );
                    }
                    return Center(
                      child: ListView.builder(
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
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
