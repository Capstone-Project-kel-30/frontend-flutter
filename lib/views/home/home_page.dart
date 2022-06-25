import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user/user_bloc.dart';
import '../../utils/routes/routes.gr.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_card.dart';
import 'widgets/home_image_carousel.dart';
import 'widgets/image_card.dart';
import 'widgets/section_container.dart';
import 'widgets/section_container_title.dart';
import 'widgets/join_membership_info.dart';
import 'widgets/video_image_card.dart';
import 'widgets/welcome_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return WelcomeBar(
                  isLoading: false,
                  username: state.user.data!.name!,
                  member: state.user.data!.memberType!,
                );
              }
              return const WelcomeBar(
                username: 'username',
                member: '',
                isLoading: true,
              );
            },
          ),
          const VerticalSpace(height: 15),
          HomeImageCarousel(
            imgList: bannerImgList,
            textList: textList,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionContainerTitle(
                moreThan5: true,
                title: 'Offline Class',
                onTap: () {
                  context.router.push(
                    ClassRoute(classType: 'Offline'),
                  );
                },
              ),
              const VerticalSpace(height: 10),
              SectionContainer(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imgList.length > 5 ? 5 : imgList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClassCard(
                        isLoading: false,
                        onTap: () {
                          context.router.push(
                            ClassDetailRoute(classType: 'Offline'),
                          );
                        },
                        startTime: '16:00',
                        img: imgList[0],
                        location: 'Gym Studio - Bandung',
                        type: 'offline',
                        title: 'aaaaaaaaaaaaaa',
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
                title: 'Online Class',
                onTap: () {
                  context.router.push(ClassRoute(classType: 'Online'));
                },
              ),
              const VerticalSpace(height: 10),
              SectionContainer(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imgList.length > 5 ? 5 : imgList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClassCard(
                        isLoading: false,
                        onTap: () {
                          context.router
                              .push(ClassDetailRoute(classType: 'Online'));
                        },
                        startTime: '16:00',
                        img: imgList[0],
                        location: 'Streaming - Zoom',
                        type: 'online',
                        title: 'aaaa',
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
                moreThan5: false,
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
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                content: AspectRatio(
                                  aspectRatio: 1,
                                  child: Text('Putar Video'),
                                ),
                              );
                            });
                      },
                      child: VideoImageCard(
                        asset: imgList[0],
                        title: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
