import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../bloc/offline_class/offline_class_bloc.dart';
import '../../bloc/online_class/online_class_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../models/user_model.dart';
import '../../utils/common/constant.dart';
import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_card.dart';
import 'widgets/home_image_carousel.dart';
import 'widgets/image_card.dart';
import 'widgets/join_membership_info.dart';
import 'widgets/section_container.dart';
import 'widgets/section_container_title.dart';
import 'widgets/video_image_card.dart';
import 'widgets/welcome_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel user = UserModel();
  bool isLoading = true;
  late YoutubePlayerController _videoController;
  final String url = 'https://www.youtube.com/watch?v=B-_GP-YKk3w';

  List<String> imgList = [
    'assets/images/dummy1.png',
    'assets/images/dummy2.jpg',
    'assets/images/dummy3.jpg',
  ];
  List<String> bannerImgList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];
  List<List<String>> textList = [
    [
      'Save more with our Membership',
      'Enjoy the All-in-One\nHealthy Lifestyle',
      'Start from Rp299.000',
      'GET IT NOW',
    ],
    [
      '',
      'Enjoy your\nfavorite classes.',
      'Get healthier with fun classes. This unlimited class is included in the membership package and you can choose the class according to what you want.',
      'Join Membership',
    ],
    [
      'Free exercise, anytime and anywhere',
      'Workout From Home.',
      'Enjoy our many free video-on-demand workouts. Find videos that match your preferences and goals!',
      'Try Now',
    ],
  ];

  void launchURL() async {
    const url = 'https://www.youtube.com/watch?v=B-_GP-YKk3w';
    var uri = Uri.parse(url);
    debugPrint(uri.toString());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserProfile());
    context.read<OnlineClassBloc>().add(GetAllOnlineClass());
    context.read<OfflineClassBloc>().add(GetAllOfflineClass());
  }

  @override
  void dispose() {
    _videoController = YoutubePlayerController(initialVideoId: '');
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserGetFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
            ),
          );
          context.router.replaceAll([
            ErrorRoute(isHome: true),
          ]);
        }
        if (state is UserSuccess) {
          setState(() {
            isLoading = false;
          });
        }
      },
      child: IgnorePointer(
        ignoring: isLoading,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    user = state.user;
                    return WelcomeBar(
                      isLoading: isLoading,
                      username: state.user.data!.name!,
                      member: state.user.data!.memberType!,
                    );
                  }
                  return WelcomeBar(
                    isLoading: isLoading,
                  );
                },
              ),
              const VerticalSpace(height: 15),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return HomeImageCarousel(
                      imgList: bannerImgList,
                      textList: textList,
                    );
                  }
                  return const ShimmerPlaceholder(
                    height: 166,
                    width: double.infinity,
                  );
                },
              ),
              const VerticalSpace(height: 20),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return Visibility(
                      visible: state.user.data!.memberType! == '',
                      child: Column(
                        children: const [
                          JoinMembershipInfo(isLoading: false),
                          VerticalSpace(height: 20),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: const [
                      JoinMembershipInfo(isLoading: true),
                      VerticalSpace(height: 20),
                    ],
                  );
                },
              ),
              BlocBuilder<OfflineClassBloc, OfflineClassState>(
                builder: (context, state) {
                  if (state is OfflineClassLoaded) {
                    final offlineClasses = state.offlineClass;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionContainerTitle(
                          moreThan5: offlineClasses.data == null
                              ? false
                              : offlineClasses.data!.length > 5,
                          title: 'Offline Class',
                          onTap: () {
                            context.router.push(
                              ClassRoute(
                                classType: offlineClass,
                                classes: offlineClasses,
                                user: user,
                              ),
                            );
                          },
                        ),
                        const VerticalSpace(height: 10),
                        SectionContainer(
                          height: 130,
                          child: offlineClasses.data != null
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: offlineClasses.data!.length > 5
                                      ? 5
                                      : offlineClasses.data!.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: ClassCard(
                                        onTap: () {
                                          context.router.push(
                                            ClassDetailRoute(
                                                user: user,
                                                classes: offlineClasses
                                                    .data![index]),
                                          );
                                        },
                                        startTime:
                                            offlineClasses.data![index].clock!,
                                        img: imgList[0],
                                        location: 'Gym Studio - Bandung',
                                        type: offlineClass,
                                        title: offlineClasses
                                            .data![index].classname!,
                                      ),
                                    );
                                  }),
                                )
                              : const Center(
                                  child: Text("No Class Available Right Now"),
                                ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ShimmerPlaceholder(height: 14, width: 100),
                          ShimmerPlaceholder(height: 14, width: 50),
                        ],
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 130,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ShimmerPlaceholder(
                                height: 125,
                                width: 150,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const VerticalSpace(height: 20),
              BlocBuilder<OnlineClassBloc, OnlineClassState>(
                builder: (context, state) {
                  if (state is OnlineClassLoaded) {
                    final onlineClasses = state.onlineClass;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionContainerTitle(
                          moreThan5: onlineClasses.data == null
                              ? false
                              : onlineClasses.data!.length > 5,
                          title: 'Online Class',
                          onTap: () {
                            context.router.push(
                              ClassRoute(
                                classType: onlineClass,
                                classes: onlineClasses,
                                user: user,
                              ),
                            );
                          },
                        ),
                        const VerticalSpace(height: 10),
                        SectionContainer(
                          height: 130,
                          child: onlineClasses.data != null
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: onlineClasses.data!.length > 5
                                      ? 5
                                      : onlineClasses.data!.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: ClassCard(
                                        onTap: () {
                                          context.router.push(
                                            ClassDetailRoute(
                                                user: user,
                                                classes:
                                                    onlineClasses.data![index]),
                                          );
                                        },
                                        startTime:
                                            onlineClasses.data![index].clock!,
                                        img: imgList[0],
                                        location: 'Streaming - Zoom',
                                        type: onlineClass,
                                        title: onlineClasses
                                            .data![index].classname!,
                                      ),
                                    );
                                  }),
                                )
                              : const Center(
                                  child: Text("No Class Available Right Now"),
                                ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ShimmerPlaceholder(height: 14, width: 100),
                          ShimmerPlaceholder(height: 14, width: 50),
                        ],
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 130,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ShimmerPlaceholder(
                                height: 125,
                                width: 150,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const VerticalSpace(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionContainerTitle(
                    moreThan5: true,
                    title: 'Health tips for you',
                    onTap: () {
                      context.router.push(const NewsletterRoute());
                    },
                  ),
                  const VerticalSpace(height: 10),
                  SectionContainer(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imgList.length > 5 ? 5 : imgList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.router.push(const NewsletterRoute());
                          },
                          child: ImageCard(
                            asset: imgList[0],
                            title: 'aaaaaaaa',
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              const VerticalSpace(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionContainerTitle(
                    moreThan5: true,
                    title: 'Workout From Home',
                    onTap: () {
                      context.router.push(const VideoContentRoute());
                    },
                  ),
                  const VerticalSpace(height: 10),
                  SectionContainer(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imgList.length > 5 ? 5 : imgList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            _videoController = YoutubePlayerController(
                              initialVideoId:
                                  YoutubePlayer.convertUrlToId(url)!,
                            );
                            showDialog(
                              context: context,
                              builder: (context) {
                                return YoutubePlayerBuilder(
                                  player: YoutubePlayer(
                                    controller: _videoController,
                                    showVideoProgressIndicator: true,
                                    progressColors: const ProgressBarColors(
                                      playedColor: kPrimaryColor,
                                      handleColor: kDarkerPrimaryColor,
                                    ),
                                    progressIndicatorColor: kPrimaryColor,
                                  ),
                                  builder: (_, p1) {
                                    return Dialog(
                                      insetPadding: EdgeInsets.zero,
                                      child: p1,
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: VideoImageCard(
                            asset: imgList[0],
                            title:
                                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
