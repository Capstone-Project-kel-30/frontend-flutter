import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_zone/views/home/widgets/class_content.dart';
import 'package:workout_zone/views/home/widgets/newsletter_content.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../bloc/newsletter/newsletter_bloc.dart';
import '../../bloc/offline_class/offline_class_bloc.dart';
import '../../bloc/online_class/online_class_bloc.dart';
import '../../bloc/user/user_bloc.dart';
import '../../models/user_model.dart';
import '../../utils/common/constant.dart';
import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/shimmer_placeholder.dart';
import '../widgets/vertical_space.dart';
import 'widgets/home_image_carousel.dart';
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
    Future.delayed(Duration.zero, () {
      context.read<UserBloc>().add(GetUserProfile());
    });
    Future.delayed(Duration.zero, () {
      context.read<OnlineClassBloc>().add(GetAllOnlineClass());
    });
    Future.delayed(Duration.zero, () {
      context.read<OfflineClassBloc>().add(GetAllOfflineClass());
    });
    Future.delayed(Duration.zero, () {
      context.read<NewsletterBloc>().add(GetAllNewsletter());
    });
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
      },
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  user = state.user;
                  return WelcomeBar(
                    isLoading: false,
                    username: state.user.data!.name!,
                    member: state.user.data!.memberType!,
                  );
                }
                return const WelcomeBar(
                  isLoading: true,
                );
              },
            ),
            const VerticalSpace(height: 15),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return HomeImageCarousel(
                    imgList: bannerImgList,
                    isMembership: state.user.data!.memberType! != "",
                    user: user,
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
                              user: user,
                            ),
                          );
                        },
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 130,
                        child: offlineClasses.data != null
                            ? ClassContent(
                                classes: offlineClasses.data!,
                                user: user,
                              )
                            : const Center(
                                child: Text("No Class Available Right Now"),
                              ),
                      ),
                    ],
                  );
                }
                if (state is OfflineClassError) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionContainerTitle(
                        moreThan5: false,
                        title: 'Offline Class',
                        onTap: () {
                          context.router.push(
                            ClassRoute(
                              classType: offlineClass,
                              user: user,
                            ),
                          );
                        },
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 130,
                        child: Center(
                          child: Column(
                            children: [
                              const Text("Unable to Fetch Data"),
                              IconButton(
                                onPressed: () {
                                  context.read<OfflineClassBloc>().add(
                                        GetAllOfflineClass(),
                                      );
                                },
                                icon: const Icon(Icons.restart_alt),
                              ),
                            ],
                          ),
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
                              user: user,
                            ),
                          );
                        },
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 130,
                        child: onlineClasses.data != null
                            ? ClassContent(
                                classes: onlineClasses.data!,
                                user: user,
                              )
                            : const Center(
                                child: Text("No Class Available Right Now"),
                              ),
                      ),
                    ],
                  );
                }
                if (state is OfflineClassError) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionContainerTitle(
                        moreThan5: false,
                        title: 'Online Class',
                        onTap: () {
                          context.router.push(
                            ClassRoute(
                              classType: onlineClass,
                              user: user,
                            ),
                          );
                        },
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 130,
                        child: Center(
                          child: Column(
                            children: [
                              const Text("Unable to Fetch Data"),
                              IconButton(
                                onPressed: () {
                                  context.read<OnlineClassBloc>().add(
                                        GetAllOnlineClass(),
                                      );
                                },
                                icon: const Icon(Icons.restart_alt),
                              ),
                            ],
                          ),
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
            BlocBuilder<NewsletterBloc, NewsletterState>(
              builder: (context, state) {
                if (state is NewsletterLoaded) {
                  final newsletters = state.newsletters;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionContainerTitle(
                        moreThan5: newsletters.data == null
                            ? false
                            : newsletters.data!.length > 5,
                        title: 'Health tips for you',
                        onTap: () {
                          context.router.push(const NewsletterRoute());
                        },
                      ),
                      const VerticalSpace(height: 10),
                      SectionContainer(
                        height: 100,
                        child: newsletters.data != null
                            ? NewsletterContent(newsletters: newsletters.data!)
                            : const Center(
                                child:
                                    Text("No Newsletter Available Right Now"),
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
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ShimmerPlaceholder(
                              height: 100,
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
                            initialVideoId: YoutubePlayer.convertUrlToId(url)!,
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
                          asset: imgList[index],
                          title: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
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
    );
  }
}
